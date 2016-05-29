class CareerPathAction < ActiveRecord::Base
 
  CATEGORY_TYPES = %w[ Postgraduate Seminar Training Conference ]  
  # Can we add a point system for higher rank faculties? So that they can only be eligible for a certain seminar
  
  belongs_to :career_path

  scope :latest, -> (size = 8) { order(start_at: :desc, end_at: :desc).limit(size) }  

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY_TYPES.each_index.map { |index| index } }
end
