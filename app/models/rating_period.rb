# == Schema Information
#
# Table name: rating_periods
#
#  id               :integer          not null, primary key
#  semester         :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  nbc_id           :integer
#  academic_year_id :integer
#
# Indexes
#
#  index_rating_periods_on_academic_year_id  (academic_year_id)
#  index_rating_periods_on_nbc_id            (nbc_id)
#

class RatingPeriod < ActiveRecord::Base 
  
  has_many :qces, dependent: :destroy
  has_many :leaves

  belongs_to :academic_year
  #belongs_to :nbcs
  
  validates :academic_year, :semester,  presence: true
  validates :semester, inclusion: { in: [1, 2] }

  alias_attribute :name, :coverage


  def coverage
    "#{semester.ordinalize} Semester of #{academic_year.coverage}"
  end

  def coverage_in_years
    # 1st Semester SY 2016-2017 (not 1st Sem June 2016-March 2017)
    "#{semester.ordinalize} Semester SY #{academic_year.coverage_in_years}"
  end
  
end

# start_at_year = start_at.strftime '%b %e %Y'
    # end_at_year = end_at.strftime '%b %e %Y'
    # "#{start_at.year} - #{end_at.year} (#{start_at_year} - #{end_at_year})"

# def coverage
#   "#{start_at.year}-#{end_at.year} #{semester.ordinalize} Sem."    
# end

# enum status: { open: 1, close: 2 }
# Declaring ENUM fields automatically adds these scopes: 
  # scope :open, -> { where(status: 1) }
  # scope :close, -> { where(status: 2) }

# Add unique index to the :is_current field
    # -> validate it also

# validates :status, inclusion: { in: RatingPeriod.statuses }    


# TODO: Check leave.rb as guide
  #
  # TODO: Validate uniqueness
  # TODO: Check for gab between the two years -> there must be only a 1 year gap for a rating period: Ex: 2006-2007; 2010-2011 
