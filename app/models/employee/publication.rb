# == Schema Information
#
# Table name: employee_publications
#
#  id                  :integer          not null, primary key
#  title               :string           not null
#  role                :integer          not null
#  academic_level      :integer          not null
#  publisher           :string
#  date_of_publication :date             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  employee_id         :integer          not null
#  description         :string(150)      default(""), not null
#
# Indexes
#
#  idx_emp_publications_on_emp_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Publication < Employee::ApplicationRecord
  ROLES = %w(Author Reviewer Translator Editor Compiler)
  ACADEMIC_LEVELS = ['Tertiary', 'High School', 'Elementary']

  belongs_to :employee

  validates :title, :publisher, presence: true
  validates :date_of_publication, presence: true
  validates :description, length: { maximum: 150 }

  validates :role, inclusion: { 
    in: ROLES.each_index.map { |index| index } 
  }

  validates :academic_level, inclusion: {
      in: ACADEMIC_LEVELS.each_index.map { |index| index }
  }
  

  def self.role_options
    ROLES.each_with_index.map { |role, index| [role, index] }  
  end

  def self.academic_level_options
    ACADEMIC_LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def role_to_string
    ROLES[role]
  end

  def academic_level_to_string
    ACADEMIC_LEVELS[academic_level]
  end

end
