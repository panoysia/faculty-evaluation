class Employee::Education < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  # LEVEL_TYPES = %w[College Masters Doctorate]
  CRITERIA_TYPES = [
            'Highest Degree',
            'Additional Degree',
            'Additional Credits'
          ]

  LEVEL_TYPES = [
    'Doctorate',
    "Master's Degree",
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

  # validates :attainment_level, presence: true,
  #           inclusion: { in: CCE::ScoringGuide.education.ids }

  validates :criteria, presence: true, inclusion: {
    in: CRITERIA_TYPES.each_index.map { |index| index }
  }

  validates :school_name, :degree_course, 
              presence: true,
              length: { maximum: 50 }

  validates :grade_units, numericality: true
  validates :honors_received, length: { maximum: 65535 }

  # validate :ensure_years_start_and_end_presence, if: Proc.new { level == 7 }
  # validates :start_at, :end_at, presence: true,
  #           if: Proc.new { level == 7 }


  after_save :create_or_update_cce_scoring_record

  # validate :years_of_study, 
  # validate :ensure_masters_and_bachelors

# * bachelor 4 years -> check for 'years of study'
# * for equivalent degree -> make sure 'masters' and 'bachelors' only

#   * for additional credits -> make sure 'grade_units' field is present

#  validate :grade_units, presence: true, if: {}

  def ensure_years_start_and_end_presence
    unless start_at.present?  && end_at.present?
      errors[:base] << "[Year Started] and [Year Ended] date values are required for Bachelor's exceeding 4 years."
    end
  end

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end
  
  def years_of_study
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)
    
    # id = self[:attainment_level]
    # scoring_guide = CCE::ScoringGuide.education.find(id)
    # scoring.cce_scoring_guide_id = id

    scoring.employee = self.employee
    scoring.cce_scoring_guide_id = 0
    scoring.score = CCE::EducationScorer.rate(self)
    scoring.criteria = Employee::CCEScoring::EDUCATION
    scoring.save
  end

end
=begin

scoring = Employee::CCEScoring.new
scoring.employee = employee
scoring.cce_scorable = self
scoring.cce_scoring_guide = cce_scoring_guide.id 
scoring.score = score
scoring.criteria = 'education' or integer equivalent
scoring.supporting_description = 'blah blah'

=end