# == Schema Information
#
# Table name: academic_years
#
#  id         :integer          not null, primary key
#  start_at   :date             not null
#  end_at     :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nbc_id     :integer
#
# Indexes
#
#  index_academic_years_on_nbc_id  (nbc_id)
#

class AcademicYear < ActiveRecord::Base
  has_many :leaves, dependent: :destroy
  has_many :leave_service_credits, dependent: :destroy
  has_many :rating_periods, dependent: :destroy

  belongs_to :nbc

  validates :start_at, :end_at, presence: true   
  validate :correct_date_range, if: :date_values_are_present?
  
  after_create :create_two_rating_periods

  scope :unused, -> { where(nbc_id: nil) }


  def self.display_all
    order(start_at: :desc, end_at: :desc)
  end


  def coverage
    # Displays "Sep 17 2016 - Mar 30 2017"; "mm dd yyyy" format
    "#{start_at.strftime('%b %d %Y')} - #{end_at.strftime('%b %d %Y')}"
  end
  
  def coverage_in_years
    "#{start_at.year}-#{end_at.year}"
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

  def date_values_are_present?
    start_at.present? && end_at.present?
  end

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

# NO_OF_YEARS_PER_NBC = 3

# TODO: solve this!
# validate :start_date_overlap


# def self.associate_to_nbc(ids, nbc_id)
#   AcademicYear.transaction do
#     valid_count = where(id: ids).count
#     if valid_count < NO_OF_YEARS_PER_NBC
#       errors[:base] << "Pleaes associate at least 3 academic years. You only selected #{valid count}."      
#     end

#     if NBC.exists?(nbc_id)
#       AcademicYear.where(id: ids).update_all(nbc_id: nbc_id)
#     else
#       errors[:base] << "The NBC record is invalid. It does not exist anymore! "
#     end

#   end   # AcademicYear.transaction

# end
