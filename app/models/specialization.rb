class Specialization < ActiveRecord::Base
  has_many :employees
  belongs_to :career_path

  validates :name, presence: true, uniqueness: true
  validates :career_path, presence: true 


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
