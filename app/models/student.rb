# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  first_name    :string(50)       not null
#  last_name     :string(50)       not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#
# Indexes
#
#  index_students_on_department_id  (department_id)
#

class Student < ActiveRecord::Base
  NUMBER_OF_STUDENT_EVALUATORS = 30

  has_one :user_account, as: :account, class_name: 'User', dependent: :destroy

  has_many :instruction_ratings, as: :evaluator, class_name: 'QCE::Instruction'

  has_many :ratings, as: :evaluator,
                      class_name: 'QCE::Rating',
                      dependent: :destroy

  has_many :rating_tasks, as: :evaluator,
                          class_name: 'QCE::RatingTask',
                          dependent: :destroy
  
  belongs_to :department

  # accepts_nested_attributes_for :user_account, 
  #   reject_if: lambda { |attributes| attributes['username'].blank? && attributes['password'].blank? }
  
  # New student is required to have an account
  accepts_nested_attributes_for :user_account

  validates :first_name, :last_name,
              presence: true,
              length: { maximum: 50 }

  validates :department, presence: true


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  # Get the record ids of 30 random students that belong to the same department of the faculty
  def self.get_ids_in_department(department_id)
    Student.where(department_id: department_id).
        ids.sample(NUMBER_OF_STUDENT_EVALUATORS)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
    
end
