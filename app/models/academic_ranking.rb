class AcademicRanking < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, 
                    length: { maximum: 50 }
  
  validates :position, presence: true,
                      numericality: { greater_than: 0, less_than: 50 }
end