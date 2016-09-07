# == Schema Information
#
# Table name: employee_academic_work_experiences
#
#  id               :integer          not null, primary key
#  employee_id      :integer          not null
#  start_at         :date             not null
#  end_at           :date             not null
#  position         :string(50)       not null
#  institution      :string(75)       not null
#  institution_type :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_employee_academic_work_experiences_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicWorkExperience < Employee::ApplicationRecord
  INSTITUTION_TYPES = %w(SUC Non-SUC)

  belongs_to :employee, required: true

  validates :institution, presence: true, length: { maximum: 75 }
  validates :institution_type, inclusion: {
    in: INSTITUTION_TYPES.each_index.map { |index| index }
  }
              
  validates :position, presence: true, length: { maximum: 50 }
  validates :start_at, :end_at, presence: true 

  
  def self.institution_type_options
    INSTITUTION_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def institution_type_to_string
    INSTITUTION_TYPES[institution_type]
  end

end
