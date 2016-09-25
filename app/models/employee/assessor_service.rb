# == Schema Information
#
# Table name: employee_assessor_services
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  name        :string(150)      not null
#  agency      :string(150)      not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_assessor_services_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AssessorService < Employee::ApplicationRecord
  include CCEScorable

  validates :name, presence: true, length: { maximum: 150 }
  validates :agency, presence: true, length: { maximum: 150 }
  
  validates :start_at, :end_at, presence: true
  validate do |record|
    fields = [:start_at, :end_at]
    CorrectDateRangeValidator.new(record, fields).validate
  end  

  after_save :create_or_update_cce_scoring_record

  
  def years_of_service
    YearCalculator.calculate(start_at, end_at)      
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AssessorService.score(self)
    scoring.save
    # scoring.supporting_description = "assessor service desc"
  end

end
