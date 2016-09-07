# == Schema Information
#
# Table name: employee_additional_degrees
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
#  index_employee_additional_degrees_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AdditionalDegree < Employee::ApplicationRecord
  DEGREE_TYPES = ["Master's", "Bachelor's"]

  belongs_to :employee, required: true

  validates :degree, presence: true, length: { maximum: 50 }
  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :institution, presence: true, length: { maximum: 50 }
  validates :start_at, :end_at, presence: true


  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

end
