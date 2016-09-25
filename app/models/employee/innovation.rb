# == Schema Information
#
# Table name: employee_innovations
#
#  id              :integer          not null, primary key
#  patent_no       :string           not null
#  year_patented   :integer          not null
#  description     :string(150)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employee_id     :integer          not null
#  name            :string           not null
#  competitiveness :integer          not null
#
# Indexes
#
#  idx_emp_innovations_on_emp_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Innovation < Employee::ApplicationRecord
  include CCEConstants::CreativeWork
  include CCEScorable

  has_and_belongs_to_many :criteria,
    class_name: Employee::InnovationCriterium,
    join_table: 'employee_innovations_criteria',
    foreign_key: 'employee_innovation_id',
    association_foreign_key: 'innovation_criterium_id'

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
    scoring.points = CCEScorer::Innovation.score(self)
    scoring.save
    # scoring.supporting_description = "innovation desc"
  end  

end
