# == Schema Information
#
# Table name: employee_public_private_work_experiences
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  position    :integer          not null
#  institution :string(75)       not null
#  start_at    :date             not null
#  end_at      :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_public_private_work_experiences_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::PublicPrivateWorkExperience < Employee::ApplicationRecord
  POSITIONS = [
    "Cooperating Teacher",
    "Basic Education Teacher"
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
