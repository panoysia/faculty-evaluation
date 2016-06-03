class Employee::Education < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  LEVEL_TYPES = %w[College Masters Doctorate]

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :level, presence: true, inclusion: { 
    in: LEVEL_TYPES.each_index.map { |index| index } 
  }  

  validates :school_name, :degree_course, 
              presence: true,
              length: { maximum: 50 }
  validates :grade_units, length: { maximum: 7 }
  validates :honors_received, length: { maximum: 65535 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end
  
end