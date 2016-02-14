class AcademicRanking < ActiveRecord::Base
  validates :rank, presence: true, 
                    length: { maximum: 50 }

  validates :position, presence: true,
                        numericality: { greater_than: 0, less_than: 50 }
end