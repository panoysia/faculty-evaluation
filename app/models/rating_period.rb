class RatingPeriod < ActiveRecord::Base 
  
  has_many :leaves

  belongs_to :academic_year
  belongs_to :nbcs
  
  validates :academic_year, :semester,  presence: true
  # 1 is for 1st Sem., 2 is for 2nd Sem.
  validates :semester, inclusion: { in: [1, 2] }

  alias_attribute :name, :coverage


  # def coverage
  #   "#{start_at.year}-#{end_at.year} #{semester.ordinalize} Sem."    
  # end

  def coverage
    start_at_year = start_at.strftime '%b %e %Y'
    end_at_year = end_at.strftime '%b %e %Y'
    "#{start_at.year} - #{end_at.year} (#{start_at_year} - #{end_at_year})"
  end

end

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