class User < ActiveRecord::Base
  # has_secure_password creates a virtual attribute named `password` and add validations for it.
  has_secure_password

  USERNAME_MAX_LENGTH = 20
  PASSWORD_MAX_LENGTH = 15

  belongs_to :account, polymorphic: true
    
  validates :username, 
    presence: true,
    length: { minimum: 5, maximum: 20 }, 
    uniqueness: true
end