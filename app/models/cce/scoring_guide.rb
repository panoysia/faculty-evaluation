# == Schema Information
#
# Table name: cce_scoring_guides
#
#  id          :integer          not null, primary key
#  description :string           not null
#  criteria    :integer          not null
#  points      :decimal(5, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
