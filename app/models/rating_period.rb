class RatingPeriod < ActiveRecord::Base 
  # TODO: Check leave.rb as guide
  # 
  # TODO: Validate numericality
  # TODO: Validate uniqueness
  # TODO: Check for gab between the two years -> there must be only a 1 year gap: Ex: 2006-2007; 2010-2011

  enum status: { open: 1, close: 2 }
  # Declaring ENUM fields automatically adds these scopes: 
    # scope :open, -> { where(status: 1) }
    # scope :close, -> { where(status: 2) }

  validates_presence_of :start_at, :end_at, :semester, :status
  validates_length_of :start_at, :end_at, is: 4

  validates_inclusion_of :status, in: RatingPeriod.statuses
  
  # 1 is for 1st Sem., 2 is for 2nd Sem.
  validates_inclusion_of :semester, in: [1, 2]

  def coverage
    "#{start_at}-#{end_at}"    
  end

=begin
  SEMESTER_TYPES = {
    '1': '1st',
    '2': '2nd'
    's': 'Summer'
  }

  SEMESTER_TYPES.keys.map(&:to_s)
=end

  # def to_s
  #   "#{SEMESTER_TYPES[semester]} for #{start_at}-#{end_at}"  
  # end

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