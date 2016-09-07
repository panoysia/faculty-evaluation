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
#  is_current    :boolean          default(FALSE), not null
#  no_of_years   :integer          not null
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
  belongs_to :employee

  validates :name, presence: true, length: { maximum: 150 }
  validates :agency, length: { maximum: 150 }
  validates :participation, length: { maximum: 150 }
  validates :start_at, presence: true
  # validates :end_at, presence: true #, if: :is_current.nil?

  # validate :ensure is_current boolean
  # t.boolean :is_current, null: false, default: false
  
  before_save :set_no_of_years


  private

  def set_no_of_years
    # end_at = Date.today if self[end_at].nil?  
    # self[:no_of_years] = YearCalculator.calculate(start_at, end_at)
    # raise Exception if name.nil?
    # raise Exception if end_at.nil?

    # byebug
    self[:no_of_years] = 0
  end

end
