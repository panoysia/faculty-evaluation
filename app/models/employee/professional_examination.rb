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
  CATEGORIES = [
    "Engineering, Accounting, Medicine, Law, Teacher's Board",

    "Career Executive Service Officers Examinaton /\nCareer Service Executive Examination",

    'Seaman Certificate; Master Electrician/Master Plumber Certificate; Plant Mechanic Certificate',

    'IT Proficiency Certification',

    'National Certificates (NC)/ Trade Skill Certificates'
  ]
  
  belongs_to :employee

  validates :title, presence: true, length: { maximum: 150 }
  validates :agency_name, presence: true, length: { maximum: 150 }
  validates :date_passed, presence: true
  validates :category, inclusion: { 
    in: CATEGORIES.each_index.map { |index| index }
  }


  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def category_to_string
    CATEGORIES[category]
  end

end
