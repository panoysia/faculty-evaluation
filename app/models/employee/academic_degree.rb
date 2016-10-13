# == Schema Information
#
# Table name: employee_academic_degrees
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  institution  :string(50)       not null
#  degree       :string(50)       not null
#  degree_type  :integer          not null
#  start_at     :date             not null
#  end_at       :date             not null
#  graduated_at :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_academic_degrees_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicDegree < Employee::ApplicationRecord
  include CCEConstants::AcademicDegree
  include CCEScorable

  scope :doctorate, -> { where(degree_type: DOCTORATE) }
  scope :licensed_md, -> { where(degree_type: MD_LICENSED) }
  scope :masters, -> { where(degree_type: MASTERS) }
  scope :llb, -> { where(degree_type: LLB) }
  scope :md, -> { where(degree_type: MD) }
  scope :bachelors_plus, -> { where(degree_type: BACHELORS_PLUS) }
  scope :bachelors, -> { where(degree_type: BACHELORS) }

  validates :degree, presence: true, length: { maximum: 50 }
  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :institution, presence: true, length: { maximum: 50 }

  validates :start_at, :end_at, presence: true
  validate do |record|
    fields = [:start_at, :end_at]
    CorrectDateRangeValidator.new(record, fields).validate
  end

  validate :four_years_minimum, if: :bachelors_plus?

  after_save :create_or_update_cce_scoring_record


  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.highest
    doctorate.presence || licensed_md.presence ||
    masters.presence || llb.presence || md.presence ||
    bachelors_plus.presence || bachelors.presence
  end


  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

  def years_of_study
    YearCalculator.calculate(start_at, end_at)
  end


  private


  def bachelors_plus?
    degree_type == BACHELORS_PLUS
  end
  
  def four_years_minimum
    if years_of_study < MINIMUM_YEARS_FOR_BACHELORS
      errors[:base] << "Minimum of four years between [Start at] date and [End at] date is required for Bachelor's (over 4 yrs.)."
    end
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)
  
    scoring.employee = self.employee
    scoring.points = CCEScorer::AcademicDegree.score(self)
    scoring.save
    #scoring.supporting_description = "academic degree desc"
  end

end   # class Employee::AcademicDegree
