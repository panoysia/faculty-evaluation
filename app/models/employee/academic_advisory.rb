class Employee::AcademicAdvisory < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  # "Nature of advisory"
  NATURES = [
    "Doctoral dissertation",
    "Master's thesis",
    "Undergraduate thesis"
  ]
  
  belongs_to :employee
  
  validates :title, presence: true, length: { maximum: 150 }
  validates :start_at, :end_at, presence: true

  validates :nature, inclusion: { 
    in: NATURES.each_index.map { |index| index }
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.nature_options
    NATURES.each_with_index.map { |type, index| [type, index] }
  end


  def nature_to_string
    NATURES[nature]
  end

end



