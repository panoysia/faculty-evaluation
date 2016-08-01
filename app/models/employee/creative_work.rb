class Employee::CreativeWork < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  COMPETITIVENESS_TYPES = [
    'International',
    'National/Regional',
    'Institutional/Local'
  ]
  
  belongs_to :employee
  has_and_belongs_to_many :criteria,
    class_name: Employee::CreativeWorkCriterium,
    join_table: 'employee_creative_works_criteria',
    foreign_key: 'employee_creative_work_id',
    association_foreign_key: 'creative_work_criterium_id'

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  validates :competitiveness, inclusion: { 
    in: COMPETITIVENESS_TYPES.each_index.map { |index| index }
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.competitiveness_type_options
    COMPETITIVENESS_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def competitiveness_to_string
    COMPETITIVENESS_TYPES[competitiveness]
  end

end
