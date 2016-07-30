class Employee::CreativeWork < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee

  validates :patent_no, :year_patented, presence: true
  validates :description, length: { maximum: 150 }

  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
