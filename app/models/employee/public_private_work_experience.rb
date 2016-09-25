# == Schema Information
#
# Table name: employee_public_private_work_experiences
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  position    :integer          not null
#  institution :string(75)       not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_public_private_work_experiences_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::PublicPrivateWorkExperience < Employee::ApplicationRecord
  include CCEConstants::PublicPrivateWorkExperience
  include CCEScorable

  validates :institution, presence: true, length: { maximum: 75 }
  validates :position, inclusion: {
    in: POSITIONS.each_index.map { |index| index }
  }

  validates :start_at, :end_at, presence: true
  validate do |record|
    fields = [:start_at, :end_at]
    CorrectDateRangeValidator.new(record, fields).validate
  end
  
  after_save :create_or_update_cce_scoring_record


  def self.position_options
    POSITIONS.each_with_index.map { |type, index| [type, index] } 
  end


  def position_to_string
    POSITIONS[position]
  end

  def years_of_service
    YearCalculator.calculate(start_at, end_at)
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::PublicPrivateWorkExperience.score(self)
    scoring.save
    # scoring.supporting_description = "public private work experience desc"
  end

end
