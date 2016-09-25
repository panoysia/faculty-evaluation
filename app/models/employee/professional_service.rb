# == Schema Information
#
# Table name: employee_professional_services
#
#  id                      :integer          not null, primary key
#  employee_id             :integer          not null
#  title                   :string(150)
#  service_type            :integer          not null
#  level                   :integer          not null
#  nature_of_participation :string(150)      default(""), not null
#  sponsoring_agency       :string(150)      not null
#  start_at                :date             not null
#  end_at                  :date             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_employee_professional_services_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalService < Employee::ApplicationRecord
  include CCEConstants::ProfessionalService
  include CCEScorable

  validates :title, :sponsoring_agency,
    presence: true, length: { maximum: 150 }
  
  validates :nature_of_participation, length: { maximum: 150 }
  
  validates :start_at, :end_at, presence: true
  validate do |record|
    fields = [:start_at, :end_at]
    CorrectDateRangeValidator.new(record, fields).validate
  end

  validates :service_type, inclusion: { 
    in: SERVICE_TYPES.each_index.map { |index| index }
  }
  
  validates :level, inclusion: { 
    in: LEVELS.each_index.map { |index| index }
  }

  after_save :create_or_update_cce_scoring_record


  def self.service_type_options
    SERVICE_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.level_options
    LEVELS.each_with_index.map { |type, index| [type, index] }
  end


  def service_type_to_string
    SERVICE_TYPES[service_type]
  end

  def level_to_string
    LEVELS[level]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::ProfessionalService.score(self)
    scoring.save
    # scoring.supporting_description = "prof. service desc"
  end

end
