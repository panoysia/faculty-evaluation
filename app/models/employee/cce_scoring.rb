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

# integer "employee_id",                                    null: false

# integer "cce_scorable_id",                                null: false
# string  "cce_scorable_type",                              null: false

# integer "nbc_id"

# integer "cce_scoring_guide_id",                           null: false

# decimal "score",                  precision: 5, scale: 2, null: false
# integer "criteria",                                       null: false
# string  "supporting_description"
