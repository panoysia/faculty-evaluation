class Admin < ActiveRecord::Base
  # has_secure_password creates a virtual attribute named `password` and add validations for it.
  has_secure_password

  validates :username,
    presence: true,
    length: { minimum: 5, maximum: 20 },
    uniqueness: true

  
  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end