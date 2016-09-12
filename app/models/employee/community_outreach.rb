# == Schema Information
#
# Table name: employee_community_outreaches
#
#  id                :integer          not null, primary key
#  project_name      :string(150)      not null
#  sponsoring_agency :string(150)      not null
#  start_at          :date             not null
#  end_at            :date             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :integer          not null
#
# Indexes
#
#  index_employee_community_outreaches_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::CommunityOutreach < Employee::ApplicationRecord
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :project_name, presence: true, length: { maximum: 150 }
  validates :sponsoring_agency, presence: true, length: { maximum: 150 }
  validates :start_at, :end_at, presence: true

  after_save :create_or_update_cce_scoring_record


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::CommunityOutreach.score(self)
    scoring.supporting_description = "community outreach desc"
    scoring.save
  end

end
