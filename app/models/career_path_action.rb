class CareerPathAction < ActiveRecord::Base
 
  CATEGORY_TYPES = %w[ Postgraduate Seminar Training Conference ]  
  # Can we add a point system for higher rank faculties? So that they can only be eligible for a certain seminar
  
  belongs_to :career_path
  
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY_TYPES.each_index.map { |index| index } }
end