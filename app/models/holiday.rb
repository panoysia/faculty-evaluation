# == Schema Information
#
# Table name: holidays
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  occurs_at  :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_weekend :integer          default(0), not null
#

class Holiday < ActiveRecord::Base
  scope :weekender, -> { where(is_weekend: 1) }

  validates :name, :occurs_at, presence: true

  before_save :set_weekend_column_value


  def set_weekend_column_value
    if occurs_at.saturday? || occurs_at.sunday?
      self[:is_weekend] = 1
    end
  end

end
