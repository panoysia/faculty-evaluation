class Student < ActiveRecord::Base
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

  accepts_nested_attributes_for :user_account

  validates :first_name, :last_name,
              presence: true,
              length: { maximum: 50 }

  validates :department, presence: true


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end