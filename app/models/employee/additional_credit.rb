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

  validates :degree, :institution,
              presence: true, length: { maximum: 50 }
  
  validates :no_of_units, presence: true

end
