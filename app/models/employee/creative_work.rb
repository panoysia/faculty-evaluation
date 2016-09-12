# == Schema Information
#
# Table name: employee_creative_works
#
#  id              :integer          not null, primary key
#  patent_no       :string           not null
#  year_patented   :integer          not null
#  description     :string(150)
#  employee_id     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string           not null
#  competitiveness :integer          not null
#
# Indexes
#
#  index_employee_creative_works_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::CreativeWork < Employee::ApplicationRecord
  include CCEConstants::CreativeWork
    
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  has_and_belongs_to_many :criteria,
    class_name: Employee::CreativeWorkCriterium,
    join_table: 'employee_creative_works_criteria',
    foreign_key: 'employee_creative_work_id',
    association_foreign_key: 'creative_work_criterium_id'

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  validates :competitiveness, inclusion: { 
    in: COMPETITIVENESS_TYPES.each_index.map { |index| index }
  }
  
  after_save :create_or_update_cce_scoring_record


  def self.competitiveness_type_options
    COMPETITIVENESS_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def competitiveness_to_string
    COMPETITIVENESS_TYPES[competitiveness]
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::CreativeWork.score(self)
    scoring.supporting_description = "creative work desc"
    scoring.save
  end

end
