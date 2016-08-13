# == Schema Information
#
# Table name: employee_educations
#
#  id               :integer          not null, primary key
#  level            :integer          not null
#  school_name      :string(50)       not null
#  degree_course    :string(50)       not null
#  grade_units      :integer
#  graduated_at     :date
#  start_at         :date
#  end_at           :date
#  honors_received  :text(65535)
#  employee_id      :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  attainment_level :integer
#  criteria         :integer
#
# Indexes
#
#  index_employee_educations_on_attainment_level  (attainment_level)
#  index_employee_educations_on_criteria          (criteria)
#  index_employee_educations_on_employee_id       (employee_id)
#

class Employee::Education < ActiveRecord::Base
  include EducationConstants
  # prefer: include Employee::EducationConstants

  self.table_name_prefix = 'employee_'

  # LEVEL_TYPES = %w[College Masters Doctorate]
  CRITERIA_TYPES = [
            'Highest Degree',
            'Additional Degree',
            'Additional Credits'
          ]

  LEVEL_TYPES = [
    'Doctorate',
    "Master's",
    'LLB',
    'MD',
    'MD - Licensed',
    'Diploma Course',
    "Bachelor's",
    "Bachelor's (> 4 yrs.)",
    '3 yrs. post secondary course',
    'Special Course (non-degree)'
  ]


  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring',
                        dependent: :destroy


  validates :level, presence: true, inclusion: { 
    in: LEVEL_TYPES.each_index.map { |index| index } 
  }

  validates :level, inclusion: { 
      in: [MASTERS, BACHELORS, BACHELORS_PLUS],
      message: "inline with additional degree is only for: Master's or Bachelor's",
    },
  if: :for_additional_degree?
  

  validates :criteria, presence: true, inclusion: {
    in: CRITERIA_TYPES.each_index.map { |index| index }
  }

  validates :school_name, :degree_course, 
              presence: true,
              length: { maximum: 50 }

  validates :honors_received, length: { maximum: 65535 }

  validates :grade_units, numericality: true,
                          presence: true,
                          if: :for_additional_credits?


  validates :graduated_at, :start_at, :end_at, presence: { message: "Graduated At needs a value." }
  validates :end_at, presence: { message: "Year Ended needs a value." }
  validates :start_at, presence: {message: Proc.new { "Year Started needs a value." } }

  validate :correct_date_range, if: :date_values_are_present?
  validate :four_years_minimum, if: :bachelors_plus?

# * bachelor 4 years -> check for 'years of study'
# validate :years_of_study, 



  after_save :create_or_update_cce_scoring_record


  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def years_of_study
    YearCalculator.calculate(start_at, end_at)
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

  def four_years_minimum
    if years_of_study < 4
      errors[:base] << "Minimum of four years between [Start at] date and [End at] date is required for Bachelor's plus."
    end
  end

  def bachelors_plus?
    level == BACHELORS_PLUS
  end

  def for_additional_degree?
    criteria == ADDITIONAL_DEGREE
  end

  def for_additional_credits?
    criteria == ADDITIONAL_CREDIT
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)
  
    scoring.employee = self.employee
    scoring.cce_scoring_guide_id = 0
    scoring.score = CCE::EducationScorer.rate(self)
    scoring.criteria = Employee::CCEScoring::EDUCATION
    scoring.save

    # id = self[:attainment_level]
    # scoring_guide = CCE::ScoringGuide.education.find(id)
    # scoring.cce_scoring_guide_id = id    
  end

end

  # def bachelors?
  #   (level == BACHELORS) || (level == BACHELORS_PLUS)
  # end

=begin

# validates :attainment_level, presence: true,
#           inclusion: { in: CCE::ScoringGuide.education.ids }

scoring = Employee::CCEScoring.new
scoring.employee = employee
scoring.cce_scorable = self
scoring.cce_scoring_guide = cce_scoring_guide.id 
scoring.score = score
scoring.criteria = 'education' or integer equivalent
scoring.supporting_description = 'blah blah'

=end
