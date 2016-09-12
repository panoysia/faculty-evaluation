# == Schema Information
#
# Table name: employee_technical_articles
#
#  id           :integer          not null, primary key
#  name         :string(50)       not null
#  level        :integer          not null
#  published_at :date             not null
#  description  :string(150)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :integer          not null
#
# Indexes
#
#  idx_emp_technical_articles_on_emp_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::TechnicalArticle < Employee::ApplicationRecord
  LEVELS = %w(International National Local)
  
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :published_at, presence: true
  validates :level, inclusion: {
      in: LEVELS.each_index.map { |index| index } 
  }
  validates :description, length: { maximum: 150 }

  after_save :create_or_update_cce_scoring_record


  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def level_to_string
    LEVELS[level]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::TechnicalArticle.score(self)
    scoring.supporting_description = "tech article desc"
    scoring.save
  end

end
