# == Schema Information
#
# Table name: employee_awards
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  name         :string(150)      not null
#  level        :integer          not null
#  date_awarded :date             not null
#  description  :string(150)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_awards_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Award < Employee::ApplicationRecord
  include CCEConstants::Award

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :date_awarded, presence: true
  validates :description, length: { maximum: 150 }
  validates :level, inclusion: { 
    in: LEVELS.each_index.map { |index| index }
  }

  after_save :create_or_update_cce_scoring_record


  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def level_to_string
    LEVELS[level]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::Award.score(self)
    scoring.supporting_description = "award desc"
    scoring.save
  end

end
