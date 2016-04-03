class LeaveServiceCredit < ActiveRecord::Base
  belongs_to :employee

  validates :valid_at, presence: true

  before_save :set_expire_at_date
  

  private

  def set_expire_at_date
    self[:expire_at] = valid_at + 1.year
  end
end