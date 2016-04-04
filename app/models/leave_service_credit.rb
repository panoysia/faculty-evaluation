class LeaveServiceCredit < ActiveRecord::Base
  belongs_to :employee
  belongs_to :academic_year

  validates :employee_id, :academic_year_id, :valid_at, presence: true

  before_save :set_expire_at_date
  

  private

  def set_expire_at_date
    self[:expire_at] = valid_at + 1.year
  end
  
end