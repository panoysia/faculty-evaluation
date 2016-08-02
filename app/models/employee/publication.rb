class Employee::Publication < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  ROLES = %w(Author Reviewer Translator Editor Compiler)
  ACADEMIC_LEVELS = ['Tertiary', 'High School', 'Elementary']

  belongs_to :employee

  validates :title, :publisher, presence: true
  validates :date_of_publication, presence: true
  validates :description, length: { maximum: 150 }

  validates :role, inclusion: { 
    in: ROLES.each_index.map { |index| index } 
  }

  validates :academic_level, inclusion: {
      in: ACADEMIC_LEVELS.each_index.map { |index| index }
  }
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.role_options
    ROLES.each_with_index.map { |role, index| [role, index] }  
  end

  def self.academic_level_options
    ACADEMIC_LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def role_to_string
    ROLES[role]
  end

  def academic_level_to_string
    ACADEMIC_LEVELS[academic_level]
  end

end
