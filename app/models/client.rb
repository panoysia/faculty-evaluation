class Client < ActiveRecord::Base
  has_one :user_account, as: :account, class_name: 'User', dependent: :destroy

  validates :first_name, :last_name,
              presence: true,
              length: { minimum: 5, maximum: 50 }

  validates :description, length: { maximum: 30 }


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end