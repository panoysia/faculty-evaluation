# == Schema Information
#
# Table name: employee_professional_examinations
#
#  id          :integer          not null, primary key
#  title       :string(150)      not null
#  agency_name :string(150)      not null
#  date_passed :date             not null
#  category    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer          not null
#
# Indexes
#
#  index_employee_professional_examinations_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalExamination < Employee::ApplicationRecord
  include CCEConstants::ProfessionalExamination

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :title, presence: true, length: { maximum: 150 }
  validates :agency_name, presence: true, length: { maximum: 150 }
  validates :date_passed, presence: true
  validates :category, inclusion: { 
    in: CATEGORIES.each_index.map { |index| index }
  }

  after_save :create_or_update_cce_scoring_record


  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def category_to_string
    CATEGORIES[category]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::ProfessionalExamination.score(self)
    scoring.supporting_description = "prof. examination desc"
    scoring.save
  end

end
