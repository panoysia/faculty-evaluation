# == Schema Information
#
# Table name: employee_civil_service_eligibilities
#
#  id                      :integer          not null, primary key
#  career_service          :string(30)       not null
#  rating                  :float(24)        not null
#  date_of_exam            :date             not null
#  place_of_exam           :string(50)
#  license_number          :string(15)
#  date_release_of_license :date
#  employee_id             :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_employee_civil_service_eligibilities_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::CivilServiceEligibility < Employee::ApplicationRecord
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :career_service, presence: true, length: { maximum: 30 }
  validates :rating, presence: true # validate numericality?
  validates :date_of_exam, presence: true
  validates :place_of_exam, length: { maximum: 50 }
  validates :license_number, length: { maximum: 15 }
  
end
