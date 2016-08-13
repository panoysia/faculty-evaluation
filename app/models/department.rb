# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(40)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_name  (name) UNIQUE
#

class Department < ActiveRecord::Base
  has_many :employees, -> { includes(:rank).
                            order(last_name: :asc, first_name: :asc)
                          }
  has_many :students, dependent: :destroy
  
  validates :name, presence: true,
                    uniqueness: true,
                    length: { maximum: 40 }


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
