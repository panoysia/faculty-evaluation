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
  belongs_to :employee, required: true
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :degree, :institution,
              presence: true, length: { maximum: 50 }
  
  validates :no_of_units, presence: true

  after_save :create_or_update_cce_scoring_record

  
  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AdditionalCredit.score(self)
    scoring.supporting_description = "additional credit desc"
    scoring.save
  end

end   # class Employee::AdditionalCredit
