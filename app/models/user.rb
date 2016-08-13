# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(20)       not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :integer
#  account_type    :string
#
# Indexes
#
#  index_users_on_account_type_and_account_id  (account_type,account_id)
#  index_users_on_username                     (username) UNIQUE
#

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
