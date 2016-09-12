# == Schema Information
#
# Table name: employee_professional_work_experiences
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  position    :integer          not null
#  institution :string(75)       not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_professional_work_experiences_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalWorkExperience < Employee::ApplicationRecord
  include CCEConstants::ProfessionalWorkExperience
  
  belongs_to :employee, required: true
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :institution, presence: true, length: { maximum: 75 }
  validates :position, inclusion: {
    in: POSITIONS.each_index.map { |index| index }
  }

  validates :start_at, :end_at, presence: true

  after_save :create_or_update_cce_scoring_record


  def self.position_options
    POSITIONS.each_with_index.map { |type, index| [type, index] } 
  end


  def position_to_string
    POSITIONS[position]
  end

  def years_of_study
    YearCalculator.calculate(start_at, end_at)
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::ProfessionalWorkExperience.score(self)
    scoring.supporting_description = "prof work experience desc"
    scoring.save
  end

end
