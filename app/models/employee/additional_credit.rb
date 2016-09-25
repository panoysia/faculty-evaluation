# == Schema Information
#
# Table name: employee_additional_credits
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  institution :string(50)       not null
#  degree      :string(50)       not null
#  no_of_units :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_additional_credits_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AdditionalCredit < Employee::ApplicationRecord
  include CCEScorable

  validates :degree, :institution,
              presence: true, length: { maximum: 50 }
  
  validates :no_of_units, presence: true
  validates :no_of_units, inclusion: { 
    within: (3..30), message: "value must be in the range of 3 to 30." 
  }

  after_save :create_or_update_cce_scoring_record

  
  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AdditionalCredit.score(self)
    scoring.save
    # scoring.supporting_description = "additional credit desc"
  end

end   # class Employee::AdditionalCredit
