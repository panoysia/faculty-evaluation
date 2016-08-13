# == Schema Information
#
# Table name: employee_scholarships
#
#  id                :integer          not null, primary key
#  employee_id       :integer          not null
#  title             :string(150)      not null
#  sponsoring_agency :string(150)      not null
#  date_granted      :date             not null
#  scholarship_type  :integer          not null
#  degree_type       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_employee_scholarships_on_employee_id  (employee_id)
#

class Employee::Scholarship < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  SCHOLARSHIP_TYPES = [
    "International, competitive",
    "International, non-competitive",
    "National/Regional, competitive",
    "National/Regional, non-competitive",
    "Local, competitive or non-competitive"
  ]
  
  DEGREE_TYPES = ["Doctorate", "Master's", "Non-degree"]

  belongs_to :employee

  validates :title, presence: true, length: { maximum: 150 }
  validates :sponsoring_agency, presence: true, length: { maximum: 150 }
  validates :date_granted, presence: true
  
  validates :scholarship_type, inclusion: { 
    in: SCHOLARSHIP_TYPES.each_index.map { |index| index }
  }

  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.scholarship_type_options
    SCHOLARSHIP_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def scholarship_type_to_string
    SCHOLARSHIP_TYPES[scholarship_type]
  end

  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

end
