class CCE::ScoringGuide < ActiveRecord::Base
  self.table_name_prefix = 'cce_'

  # Match the value of the constants in Employee::CCEScoring model
  EDUCATION = Employee::CCEScoring::EDUCATION
  EXPERIENCE = Employee::CCEScoring::EXPERIENCE
  PROFESSIONAL_DEVELOPMENT = Employee::CCEScoring::PROFESSIONAL_DEVELOPMENT

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

end

# CCE::ScoringGuide, 

# t.string   "description",                         null: false
# t.integer  "criteria",                            null: false
# t.decimal  "points",      precision: 5, scale: 2, null: false

=begin

## Criteria is { 
  1: education,
  2: experience,
  3: profdev 
}

  Education     = 85
  Experience    = 25
  Profdev       = 90
          Total = 200

## Area/context/category/criteria:
  1 is for Education
  2 is for Experience
  3 is for Professiional Development

=end

=begin

Criteria:
2. Experience and Length of service
  2.1 Academic Experience
    2.1.1
    2.1.2

  2.2 Administrative Experience
    a. president
    b. vice president
    c. dean/director/schoo/superintendent
    d. principal

  2.3

3. Professional Development Achievement and Honors
  3.1 Inventions
  3.2 Discoveries
  3.3 Creative Work
  3.4
# --
=end

=begin
    
  2. Experience and Length of service
    * employee_work_experiences (Work Experiences)
    
  3. Professional Development Achievement and Honors
    * employee_trainings (Trainings)
    * employee_voluntary_works (Voluntary Works)
    * employee_civil_service_eligibilities (Civil Service Eligibilities)

? employee_other_infos

=end
