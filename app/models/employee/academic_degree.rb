# == Schema Information
#
# Table name: employee_academic_degrees
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  institution  :string(50)       not null
#  degree       :string(50)       not null
#  degree_type  :integer          not null
#  start_at     :date             not null
#  end_at       :date             not null
#  graduated_at :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_academic_degrees_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicDegree < Employee::ApplicationRecord
  include CCEConstants::AcademicDegree

  belongs_to :employee, required: true
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :degree, presence: true, length: { maximum: 50 }
  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :institution, presence: true, length: { maximum: 50 }
  validates :start_at, :end_at, presence: true
  
  validate :correct_date_range, if: :date_values_are_present?
  validate :four_years_minimum, if: :bachelors_plus?

  after_save :create_or_update_cce_scoring_record


  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

  def years_of_study
    YearCalculator.calculate(start_at, end_at)
  end


  private


  def date_values_are_present?
    start_at.present? && end_at.present?
  end

  def bachelors_plus?
    degree_type == BACHELORS_PLUS
  end

  def correct_date_range
    unless end_at > start_at
      errors[:base] << "Invalid date range.\n[End At] date value must be greater than [Start At] date value."
    end
  end

  def four_years_minimum
    if years_of_study < 4
      errors[:base] << "Minimum of four years between [Start at] date and [End at] date is required for Bachelor's (over 4 yrs.)."
    end
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)
  
    scoring.employee = self.employee
    scoring.points = CCEScorer::AcademicDegree.score(self)
    scoring.supporting_description = "academic degree desc"
    scoring.save
  end

end   # class Employee::AcademicDegree
