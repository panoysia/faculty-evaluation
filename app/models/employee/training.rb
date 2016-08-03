class Employee::Training < ActiveRecord::Base  
  self.table_name_prefix = 'employee_'

  LEVELS = ['National/Regional', 'International', 'Local']
  CATEGORIES = ['Training', 'Seminars/Conferences']

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :title, presence: true, length: { maximum: 100 }
  validates :start_at, :end_at, presence: true
  validates :conducted_by, presence: true, length: { maximum: 50 }
 
  validates :level, presence: true, inclusion: { 
    in: LEVELS.each_index.map { |index| index } 
  }

  validates :category, presence: true, inclusion: { 
    in: CATEGORIES.each_index.map { |index| index } 
  }

  validate :correct_date_range, if: :date_values_are_present?

  before_save :set_no_of_days

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end

  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def level_to_string
    LEVELS[level]
  end

  def category_to_string
    CATEGORIES[category]
  end


  private

  def date_values_are_present?
    start_at.present? && end_at.present?
  end

  def correct_date_range
    unless end_at > start_at
      errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
    end
  end

  def set_no_of_days
    self[:no_of_days] = ((end_at - start_at).to_i) + 1
  end

end
