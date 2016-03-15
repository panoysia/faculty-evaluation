class Employee::Rating < ActiveRecord::Base
  belongs_to :rating_period
  belongs_to :employee

  # This scopes may not be used at all. I just put it in here for reference purposes and might turn out useful in the future. 
  # Employee::Rating.instruction, .. etc
  scope :instruction , -> { where type: 'Employee::Rating::Instruction' }
  scope :research , -> { where type: 'Employee::Rating::Research' }
  scope :extension, -> { where type: 'Employee::Rating::Extension' }
  scope :production , -> { where type: 'Employee::Rating::Production' }
end