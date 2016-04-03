class Employee::Training < ActiveRecord::Base  
  self.table_name_prefix = 'employee_'

  LEVEL_TYPES = %w[National International]

  belongs_to :employee

  validates :level, presence: true, inclusion: { 
    in: LEVEL_TYPES.each_index.map { |index| index } 
  }

  validates :title, presence: true, length: { maximum: 100 }
  validates :start_at, :end_at, presence: true
  validates :conducted_by, length: { maximum: 50 }
  # validates :no_of_hours (numericality)
    # t.integer  "no_of_hours",  limit: 2
 

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end