# == Schema Information
#
# Table name: employee_awards
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  name         :string(150)      not null
#  level        :integer          not null
#  date_awarded :date             not null
#  description  :string(150)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_awards_on_employee_id  (employee_id)
#

class Employee::Award < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  LEVELS = ['International', 'National/Regional', 'Local']

  belongs_to :employee
  
  validates :name, presence: true, length: { maximum: 150 }
  validates :date_awarded, presence: true
  validates :description, length: { maximum: 150 }
  validates :level, inclusion: { 
    in: LEVELS.each_index.map { |index| index }
  }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def level_to_string
    LEVELS[level]
  end

end
