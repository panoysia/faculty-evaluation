# == Schema Information
#
# Table name: employee_inventions
#
#  id            :integer          not null, primary key
#  patent_no     :string           not null
#  year_patented :integer          not null
#  description   :string(150)
#  employee_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  patent_type   :integer          not null
#  name          :string           not null
#
# Indexes
#
#  index_employee_inventions_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::Invention < Employee::ApplicationRecord
  PATENT_TYPES = [
    'Philippine Intellectual Property Office Utility Model', 
    'Philippine Intellectual Property Office'
  ]

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: Employee::CCEScoring,
                        dependent: :destroy

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  validates :patent_type, inclusion: { 
    in: PATENT_TYPES.each_index.map { |index| index } 
  }
  
  after_save :create_or_update_cce_scoring_record


  def self.patent_type_options
    PATENT_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  private


  def create_or_update_cce_scoring_record
    scoring = Employee::CCEScoring.find_or_initialize_by(cce_scorable: self)

    scoring.employee = self.employee
    scoring.points = CCEScorer::Invention.score(self)
    scoring.supporting_description = "invention desc"
    scoring.save
  end

end
