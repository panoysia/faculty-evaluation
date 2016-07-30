class Employee::Publication < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  ROLES = %w(mon tue wed)
  ACADEMIC_LEVELS = ['Tertialry', 'High School', 'Elementary']

  belongs_to :employee

  validates :title, presence: true
  validates :date_of_publication, presence: true

  # validates :level, inclusion: {
  #     in: LEVELS.each_index.map { |index| index } 
  # }
  validates :nature, inclusion: { in: [] }
  validates :role, inclusion: { in: [] }
  validates :academic_level, inclusion: {
      in: []
  }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
