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

  has_many :leaves 

  #, inverse_of: :employee
  
  validates :first_name, :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end
end