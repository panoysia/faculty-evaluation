# == Schema Information
#
# Table name: employee_scholarships
#
#  id                :integer          not null, primary key
#  employee_id       :integer          not null
#  title             :string(150)      not null
#  sponsoring_agency :string(150)      not null
#  date_granted      :date             not null
#  scholarship_type  :integer          not null
#  degree_type       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_employee_scholarships_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Scholarship < Employee::ApplicationRecord
  include CCEConstants::Scholarship

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :title, presence: true, length: { maximum: 150 }
  validates :sponsoring_agency, presence: true, length: { maximum: 150 }
  validates :date_granted, presence: true
  
  validates :scholarship_type, inclusion: { 
    in: SCHOLARSHIP_TYPES.each_index.map { |index| index }
  }

  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }
  
  after_save :create_or_update_cce_scoring_record

  
  def self.scholarship_type_options
    SCHOLARSHIP_TYPES.each_with_index.map { |type, index| [type, index] }
  end

  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def scholarship_type_to_string
    SCHOLARSHIP_TYPES[scholarship_type]
  end

  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::Scholarship.score(self)
    scoring.supporting_description = "scholarship desc"
    scoring.save
  end

end
