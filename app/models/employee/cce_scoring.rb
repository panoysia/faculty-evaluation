class Employee::CCEScoring < ActiveRecord::Base
  self.table_name_prefix = 'employee_'  

  EDUCATION = 1
  EXPERIENCE = 2
  PROFESSIONAL_DEVELOPMENT = 3

  belongs_to :employee
  belongs_to :cce_scoring_guide, class_name: 'CCE::ScoringGuide'
  belongs_to :cce_scorable, polymorphic: true
  belongs_to :nbc

  scope :education, -> { where(criteria: EDUCATION) } 
  scope :experience, -> { where(criteria: EXPERIENCE) }
  scope :profdev, -> { where(criteria: PROFESSIONAL_DEVELOPMENT) }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def nbc_recorded?
    nbc_id.present?
  end
  
end

=begin
  :employee_id, integer, null: false  
  :cce_scorable_id, integer, null: false
  :cce_scorable_type, string, null: false

  :nbc_id, integer
  :cce_scoring_guide_id, integer, null: false

  :points, decimal, precision: 5, scale: 2, null: false
  :criteria, integer, null: false  
  :supporting_description, string
=end
