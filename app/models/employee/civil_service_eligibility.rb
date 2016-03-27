class Employee::CivilServiceEligibility < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee

  validates :career_service, presence: true, length: { maximum: 30 }
  validates :rating, presence: true # validate numericality?
  validates :date_of_exam, presence: true
  validates :place_of_exam, length: { maximum: 50 }
  validates :license_number, length: { maximum: 15 }
  

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end