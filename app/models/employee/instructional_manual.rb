class Employee::InstructionalManual < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  LEVELS = %w(International National Local)
  CATEGORIES = %w(Manual Audio-visual)

  belongs_to :employee

  validates :name, presence: true, length: { maximum: 50 }
  validates :published_at, presence: true
  validates :level, inclusion: {
      in: LEVELS.each_index.map { |index| index } 
  }
  validates :category, inclusion: {
      in: CATEGORIES.each_index.map { |index| index } 
  }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
