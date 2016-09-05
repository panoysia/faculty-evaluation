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

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  validates :patent_type, inclusion: { 
    in: PATENT_TYPES.each_index.map { |index| index } 
  }
  

  def self.patent_type_options
    PATENT_TYPES.each_with_index.map { |type, index| [type, index] }
  end

end
