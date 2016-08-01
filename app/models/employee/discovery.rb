class Employee::Discovery < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee
  has_and_belongs_to_many :criteria,
    class_name: Employee::DiscoveryCriterium,
    join_table: 'employee_discoveries_criteria',
    foreign_key: 'employee_discovery_id',
    association_foreign_key: 'discovery_criterium_id'

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
