# == Schema Information
#
# Table name: employee_trainer_services
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  name        :string(150)      not null
#  agency      :string(150)      not null
#  start_at    :date             not null
#  end_at      :date
#  is_current  :boolean          default(FALSE), not null
#  no_of_years :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_trainer_services_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::TrainerService < Employee::ApplicationRecord 
  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :agency, presence: true, length: { maximum: 150 }
  validates :start_at, presence: true
  # validates :end_at, presence: true #, if: :is_current.nil?

  # validate :ensure is_current boolean
  # t.boolean :is_current, null: false, default: false
  
  before_save :set_no_of_years
  after_save :create_or_update_cce_scoring_record


  private


  def set_no_of_years
    # end_at = Date.today if self[end_at].nil?  
    # self[:no_of_years] = YearCalculator.calculate(start_at, end_at)
    # raise Exception if name.nil?
    # raise Exception if end_at.nil?

    # byebug
  end

  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::TrainerService.score(self)
    scoring.supporting_description = "trainer service desc"
    scoring.save
  end

end
