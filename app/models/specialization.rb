class Specialization < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, uniqueness: true


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end