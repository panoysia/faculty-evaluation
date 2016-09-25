# == Schema Information
#
# Table name: employee_academic_honors
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  award        :string(150)      not null
#  degree_type  :integer          not null
#  honor_type   :integer          not null
#  school       :string(150)      not null
#  date_awarded :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_academic_honors_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AcademicHonor < Employee::ApplicationRecord
  include CCEConstants::AcademicHonor
  include CCEScorable

  validates :award, presence: true, length: { maximum: 150 }  
  validates :school, presence: true, length: { maximum: 150 }
  validates :date_awarded, presence: true

  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :honor_type, inclusion: { 
    in: HONOR_TYPES.each_index.map { |index| index }
  }
  
  validate :undergraduate_degree_honor_type,
    if: Proc.new { |record| record.degree_type == UNDERGRADUATE }

  validate :graduate_degree_honor_type,
    if: Proc.new { |record| record.degree_type == GRADUATE }

  after_save :create_or_update_cce_scoring_record


  def self.honor_type_options
    HONOR_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def honor_type_to_string
    HONOR_TYPES[honor_type]
  end

  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end


  private


  def graduate_degree_honor_type
    error_message = "For a Graduate degree, only Highest Honors w/ Distinction is allowed for the [Honor] type criteria."

    unless honor_type == HONORS_WITH_DISTINCTION
      errors[:base] << error_message
    end
  end

  def undergraduate_degree_honor_type
    undergraduate_honors = [SUMMA_CUM_LAUDE, MAGNA_CUM_LAUDE, CUM_LAUDE]
    error_message = "For an Undergraduate degree, your choices for [Honor] type criteria are: Summa cum Laude, Magna cum Laude, and Cum Laude."

    unless honor_type.in? undergraduate_honors
      errors[:base] << error_message
    end
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AcademicHonor.score(self)
    scoring.save
    # scoring.supporting_description = "academic honor desc"
  end

end
