# == Schema Information
#
# Table name: employee_trainings
#
#  id                      :integer          not null, primary key
#  title                   :string(100)      not null
#  start_at                :date             not null
#  end_at                  :date             not null
#  no_of_days              :integer
#  conducted_by            :string(50)       not null
#  employee_id             :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  level                   :integer          not null
#  nature_of_participation :string           default(""), not null
#  category                :integer          not null
#
# Indexes
#
#  index_employee_trainings_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Training < Employee::ApplicationRecord
  include CCEConstants::Training

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :start_at, :end_at, presence: true
  validates :conducted_by, presence: true, length: { maximum: 50 }
 
  validates :level, presence: true, inclusion: { 
    in: LEVELS.each_index.map { |index| index } 
  }

  validates :category, presence: true, inclusion: { 
    in: CATEGORIES.each_index.map { |index| index } 
  }

  validate :correct_date_range, if: :date_values_are_present?

  before_save :set_no_of_days
  after_save :create_or_update_cce_scoring_record


  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end

  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def level_to_string
    LEVELS[level]
  end

  def category_to_string
    CATEGORIES[category]
  end


  private


  def date_values_are_present?
    start_at.present? && end_at.present?
  end

  def correct_date_range
    unless end_at > start_at
      errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
    end
  end

  def set_no_of_days
    self[:no_of_days] = ((end_at - start_at).to_i) + 1
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::Training.score(self)
    scoring.supporting_description = "training credit desc"
    scoring.save
  end

end
