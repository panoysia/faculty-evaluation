class AcademicYear < ActiveRecord::Base

  has_many :rating_periods, dependent: :destroy
  has_many :leaves, dependent: :destroy

  validates :start_at, :end_at, presence: true   
  validate :correct_date_range #, unless: :date_values_are_nil?
  validate :start_date_overlap

  after_create :create_two_rating_periods


  def self.display_all
    order(start_at: :desc, end_at: :desc)
  end

  def coverage
    "#{start_at.year} - #{end_at.year}"
  end

  def coverage_with_details
    start_at_year = start_at.year
    end_at_year = end_at.year
    start_at_formatted = start_at.strftime('%b %d %Y')
    end_at_formatted = end_at.strftime('%b %d %Y')

    "#{start_at_year} - #{end_at_year} (#{start_at_formatted} - #{end_at_formatted})"
  end

  private

  def create_two_rating_periods
    id = self[:id]

    1.upto(2) do |number|
      RatingPeriod.create(academic_year_id: id, semester: number)
    end    
  end

  # def date_values_are_nil?
  #   start_at.nil? && end_at.nil?
  # end

  def correct_date_range
    unless end_at > start_at
      errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
    end
  end

  def start_date_overlap
    result = AcademicYear.where(':date_value <= end_at', date_value: self[:start_at])
    unless result.empty?
      puts self[:start_at]
      errors[:base] << "Starting date is invalid. There are existing records that is in the range of this value."
    end
  end

end   # class Academic Year