# == Schema Information
#
# Table name: employee_voluntary_works
#
#  id           :integer          not null, primary key
#  organization :string(70)       not null
#  start_at     :date             not null
#  end_at       :date             not null
#  no_of_hours  :integer
#  position     :string(50)
#  employee_id  :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_voluntary_works_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::VoluntaryWork < Employee::ApplicationRecord
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :organization, presence: true, length: { maximum: 70 }
  validates :start_at, :end_at, presence: true
  # validates :no_of_hours, numericality: {}
  validates :position, length: { maximum: 50 }

end
