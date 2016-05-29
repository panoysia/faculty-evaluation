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
# t.string   "name",       null: false
# t.date     "occurs_at",  null: false
# t.integer  "is_weekend", null: false
