class User < ActiveRecord::Base
  USERNAME_MAX_LENGTH = 20
  PASSWORD_MAX_LENGTH = 15

  # has_secure_password creates a virtual attribute named `password` and add validations for it.
  has_secure_password

  belongs_to :account, polymorphic: true

  scope :employee, -> { where(account_type: 'Employee') }
  scope :student, -> { where(account_type: 'Student') }
  scope :client, -> { where(account_type: 'Client') }

  validates :username, presence: true,
                        length: { minimum: 5, maximum: 20 }, 
                        uniqueness: true
end
