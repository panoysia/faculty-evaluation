# == Schema Information
#
# Table name: employee_additional_credits
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  institution :string(50)       not null
#  degree      :string(50)       not null
#  no_of_units :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  degree_type :integer          default(1), not null
#
# Indexes
#
#  index_employee_additional_credits_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::AdditionalCredit < Employee::ApplicationRecord
  include CCEConstants::AdditionalCredit
  include CCEScorable

  scope :doctorate, -> { where(degree_type: DOCTORATE) }
  scope :masters, -> { where(degree_type: MASTERS) }

  validates :degree, :institution,
              presence: true, length: { maximum: 50 }

  validates :degree_type, inclusion: { 
    in: DEGREE_TYPES.each_index.map { |index| index }
  }

  validates :no_of_units, presence: true
  validates :no_of_units, inclusion: { 
    within: (3..30), message: "value must be in the range of 3 to 30." 
  }

  after_save :create_or_update_cce_scoring_record


  def self.degree_type_options
    DEGREE_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def degree_type_to_string
    DEGREE_TYPES[degree_type]
  end

  
  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::AdditionalCredit.score(self)
    scoring.save
    # scoring.supporting_description = "additional credit desc"
  end

end   # class Employee::AdditionalCredit
