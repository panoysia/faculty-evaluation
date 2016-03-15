# This code is commented and act only for reference on using namespaced models.

# module Employee
#   def self.table_name_prefix
#     'employee_'
#   end
# end

class Employee < ActiveRecord::Base
  has_one :rank, class_name: 'AcademicRank'

  has_many :civil_service_eligibilities
  has_many :educations
  has_many :other_infos
  has_many :trainings
  has_many :voluntary_works
  has_many :work_experiences

  has_many :timesheets
  has_many :draft_timesheets, -> { where(submitted: false) }, class_name: 'Timesheet'

  has_many :ratings
  has_many :instruction_ratings, 
    -> { where(type: 'Employee::Rating::Instruction') },
    class_name: 'Employee::Rating'
  has_many :research_ratings,
    -> { where(type: 'Employee::Rating::Research') },
    class_name: 'Employee::Rating'
  has_many :extension_ratings, 
    -> { where(type: 'Employee::Rating::Extension') },
    class_name: 'Employee::Rating'
  has_many :production_ratings, 
    -> { where(type: 'Employee::Rating::Production') },
    class_name: 'Employee::Rating'

  has_many :leaves 
  has_many :career_paths

  #, inverse_of: :employee
  
  validates :first_name, :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end
end