# == Schema Information
#
# Table name: employee_professional_reviews
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  name        :string(150)      not null
#  occurred_at :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  review_type :integer          not null
#
# Indexes
#
#  index_employee_professional_reviews_on_employee_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::ProfessionalReview < Employee::ApplicationRecord
  REVIEW_TYPES = [
    'Professional Regulations Commission',
    'Civil Service Commission'
  ]

  belongs_to :employee

  validates :name, presence: true, length: { maximum: 150 }
  validates :occurred_at, presence: true
  
  validates :review_type, inclusion: {
    in: REVIEW_TYPES.each_index.map { |index| index }
  }


  def self.review_type_options
    REVIEW_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def review_type_to_string
    REVIEW_TYPES[review_type]
  end

end
