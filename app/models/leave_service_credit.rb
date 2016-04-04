class LeaveServiceCredit < ActiveRecord::Base
  belongs_to :employee
  belongs_to :academic_year

  validates :employee_id, :academic_year_id, :valid_at, presence: true
  validates :no_of_days, presence: true # numericality also
  validate :ensure_within_academic_year

  before_save :set_expire_at_date
  

  private

  def ensure_within_academic_year
    unless (academic_year.start_at..academic_year.end_at).include?(valid_at.to_date)
      errors[:base] << "Ensure that the Valid At date must be within the date range of the selected academic year period."
    end
  end

  # def correct_date_range
  #   unless end_at > start_at
  #     errors[:base] << "Invalid date range.\n'End at' date value must be greater than 'Start at' date value."
  #   end
  # end

  def set_expire_at_date
    self[:expire_at] = valid_at + 1.year
  end

end