# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  first_name  :string(50)       not null
#  last_name   :string(50)       not null
#  description :string(30)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Client < ActiveRecord::Base
  has_one :user_account, as: :account, class_name: 'User', dependent: :destroy

  has_many :ratings, as: :evaluator,
                      class_name: 'QCE::Rating',
                      dependent: :destroy

  has_many :rating_tasks, as: :evaluator,
                          class_name: 'QCE::RatingTask',
                          dependent: :destroy
                          
  accepts_nested_attributes_for :user_account

  validates :first_name, :last_name,
              presence: true,
              length: { maximum: 50 }

  validates :description, length: { maximum: 30 }


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
