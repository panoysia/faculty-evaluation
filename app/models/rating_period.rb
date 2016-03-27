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

  validates :start_at, :end_at, :semester, :status, presence: true
  validates :start_at, :end_at, length: { is: 4 }
  validates :status, inclusion: { in: RatingPeriod.statuses }
  # 1 is for 1st Sem., 2 is for 2nd Sem.
  validates :semeseter, inclusion: { in: [1, 2] }

  
  def coverage
    "#{start_at}-#{end_at}"    
  end

end