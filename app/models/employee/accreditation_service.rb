# == Schema Information
#
# Table name: employee_accreditation_services
#
#  id            :integer          not null, primary key
#  employee_id   :integer          not null
#  name          :string(150)      not null
#  participation :string(150)      default(""), not null
#  start_at      :date             not null
#  end_at        :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  agency        :string(150)      default(""), not null
#
# Indexes
#
#  index_employee_accreditation_services_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AccreditationService < Employee::ApplicationRecord
  include CCEScorable

  validates :name, presence: true, length: { maximum: 150 }
  validates :agency, length: { maximum: 150 }
  validates :participation, length: { maximum: 150 }
  
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
    scoring.points = CCEScorer::AccreditationService.score(self)
    scoring.save
    # scoring.supporting_description = "accreditation service desc"
  end

end
