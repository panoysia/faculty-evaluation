# == Schema Information
#
# Table name: employee_academic_honors
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  award        :string(150)      not null
#  degree_type  :integer          not null
#  honor_type   :integer          not null
#  school       :string(150)      not null
#  date_awarded :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_academic_honors_on_employee_id  (employee_id)
#

class Employee::AcademicHonor < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  DEGREE_TYPES = ["Undergraduate", "Graduate"]

  HONOR_TYPES = [
    "Summa cum Laude",
    "Magna cum Laude",
    "Cum Laude",
    "Highest Honors/With Distinction or equivalent"
  ]
  
  belongs_to :employee

  validates :award, presence: true, length: { maximum: 150 }  
  validates :school, presence: true, length: { maximum: 150 }
  validates :date_awarded, presence: true

  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :honor_type, inclusion: { 
    in: HONOR_TYPES.each_index.map { |index| index }
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.honor_type_options
    HONOR_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def honor_type_to_string
    HONOR_TYPES[honor_type]
  end

  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

end
