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

class Employee::ProfessionalReview < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

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

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.review_type_options
    REVIEW_TYPES.each_with_index.map { |type, index| [type, index] }
  end


  def review_type_to_string
    REVIEW_TYPES[review_type]
  end

end
