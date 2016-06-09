class CareerPathAction < ActiveRecord::Base
 
  CATEGORY_TYPES = %w[ Postgraduate Seminar Training Conference ]  
  # Can we add a point system for higher rank faculties? So that they can only be eligible for a certain seminar
  
  POSTGRADUATE = 0
  SEMINAR = 1
  TRAINING = 2
  CONFERENCE = 3

  # has_many :matched_employees, -> {}

  has_many :employees, through: :specialization,
                        source: :employees
  belongs_to :specialization
  
  scope :latest, -> (size = 8) { order(start_at: :desc, end_at: :desc).limit(size) }  
  
  scope :postgraduate, -> { where(category: POSTGRADUATE) }
  scope :seminar, -> { where(category: SEMINAR) }
  scope :training, -> { where(category: TRAINING) }
  scope :conference, -> { where(category: CONFERENCE) }

  validates :name, presence: true
  validates :specialization, presence: true

  validates :category, presence: true, inclusion: { in: CATEGORY_TYPES.each_index.map { |index| index } }
end
