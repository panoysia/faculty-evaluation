class Employee::Invention < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  PATENT_TYPES = [
    'Philippine Intellectual Property Office Utility Model', 
    'Philippine Intellectual Property Office'
  ]

  belongs_to :employee

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  validates :patent_type, inclusion: { 
    in: PATENT_TYPES.each_index.map { |index| index } 
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.patent_type_options
    PATENT_TYPES.each_with_index.map { |type, index| [type, index] }
  end

end
