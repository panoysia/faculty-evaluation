class User < ActiveRecord::Base
  # has_secure_password creates a virtual attribute named `password` and add validations for it.
  has_secure_password

  validates :username, 
    presence: true,
    length: { maximum: 20 }, 
    uniqueness: true
end