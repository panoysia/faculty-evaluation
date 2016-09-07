# == Schema Information
#
# Table name: employee_professional_work_experiences
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  position    :integer          not null
#  institution :string(75)       not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_professional_work_experiences_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalWorkExperience < Employee::ApplicationRecord
  POSITIONS = [
    "Manager/Entrepreneur/Consultant",
    "Supervisor/Head of Unit",
    "Rank and File"
  ]

  belongs_to :employee, required: true
  
  validates :institution, presence: true, length: { maximum: 75 }
  validates :position, inclusion: {
    in: POSITIONS.each_index.map { |index| index }
  }

  validates :start_at, :end_at, presence: true


  def self.position_options
    POSITIONS.each_with_index.map { |type, index| [type, index] } 
  end


  def position_to_string
    POSITIONS[position]
  end

end
