# == Schema Information
#
# Table name: employee_other_infos
#
#  id          :integer          not null, primary key
#  context     :integer          not null
#  info        :string(100)      not null
#  employee_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_other_infos_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::OtherInfo < Employee::ApplicationRecord
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  # validates :context, presence: true, inclusion: { in: [] }
  validates :info, presence: true, length: { maximum: 100 }
  
end
