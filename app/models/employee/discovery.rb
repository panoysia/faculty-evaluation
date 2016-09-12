# == Schema Information
#
# Table name: employee_discoveries
#
#  id            :integer          not null, primary key
#  patent_no     :string           not null
#  year_patented :integer          not null
#  description   :string(150)
#  employee_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string           not null
#
# Indexes
#
#  index_employee_discoveries_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Discovery < Employee::ApplicationRecord

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  has_and_belongs_to_many :criteria,
    class_name: Employee::DiscoveryCriterium,
    join_table: 'employee_discoveries_criteria',
    foreign_key: 'employee_discovery_id',
    association_foreign_key: 'discovery_criterium_id'

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  after_save :create_or_update_cce_scoring_record


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::Discovery.score(self)
    scoring.supporting_description = "discovery desc"
    scoring.save
  end

end
