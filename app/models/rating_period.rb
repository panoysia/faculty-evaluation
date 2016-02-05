class RatingPeriod < ActiveRecord::Base
  SEMESTERS = {
    '1': '1st',
    '2': '2nd',
    's': 'Summer'
  }

  enum status: { open: 1, close: 2 }

  validates :start_at, :end_at, :semester, :status, presence: true

  # validate :start_at and :end_at?

  validates_inclusion_of :status, in: RatingPeriod.statuses
  validates_inclusion_of :semester, in: SEMESTERS.keys.map(&:to_s)
  
  # def self.convert_semester(value)
  #   SEMESTERS[value.to_sym]
  # end

  # def semester
  #   unless self[:semester].nil?
  #     value = self[:semester].to_sym
  #     SEMESTERS[value]
  #   end
  # end
end