class Employee < ActiveRecord::Base
  has_many :leaves 
  #, inverse_of: :employee
  
  validates :first_name, :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name}"
  end
end