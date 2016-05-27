class Student < ActiveRecord::Base
  has_one :user_account, as: :account, class_name: 'User', dependent: :destroy

  has_many :instruction_ratings, as: :evaluator, class_name: 'QCE::Instruction'
  
  # accepts_nested_attributes_for :user_account, 
  #   reject_if: lambda { |attributes| attributes['username'].blank? && attributes['password'].blank? }

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
end