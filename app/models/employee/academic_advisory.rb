# == Schema Information
#
# Table name: employee_academic_advisories
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  title       :string(150)      not null
#  nature      :integer          not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_academic_advisories_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicAdvisory < Employee::ApplicationRecord
  include CCEConstants::AcademicAdvisory
  include CCEScorable

  validates :title, presence: true, length: { maximum: 150 }
  validates :start_at, :end_at, presence: true
  validate do |record|
    fields = [:start_at, :end_at]
    CorrectDateRangeValidator.new(record, fields).validate
  end

  validates :nature, inclusion: { 
    in: NATURES.each_index.map { |index| index }
  }
  
  after_save :create_or_update_cce_scoring_record

  
  def self.nature_options
    NATURES.each_with_index.map { |type, index| [type, index] }
  end


  def nature_to_string
    NATURES[nature]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AcademicAdvisory.score(self)
    scoring.save
    # scoring.supporting_description = "academic advisory desc" 
  end

end   # Employee::AcademicAdvisory