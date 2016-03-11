class Admin < ActiveRecord::Base
  # has_secure_password creates a virtual attribute named `password` and add validations for it.
  has_secure_password

  validates :username,
    presence: true,
    length: { minimum: 5, maximum: 20 },
    uniqueness: true
end