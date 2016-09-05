# == Schema Information
#
# Table name: employee_academic_degrees
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  institution  :string(50)       not null
#  degree       :string(50)       not null
#  degree_type  :integer          not null
#  start_at     :date             not null
#  end_at       :date             not null
#  graduated_at :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_academic_degrees_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicDegree < Employee::ApplicationRecord
  DEGREE_TYPES = [
    "Doctorate",
    "Master's",
    "LLB",
    "MD",
    "MD - Licensed",
    "Diploma Course",
    "Bachelor's",
    "Bachelor's (> 4 yrs.)",
    "3 yr. post secondary course",
    "Special Course (non-degree)"
  ]

  belongs_to :employee, required: true

  validates :degree, presence: true, length: { maximum: 50 }
  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :end_at, presence: true
  validates :institution, presence: true, length: { maximum: 50 }
  validates :start_at, presence: true


  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

end
