class AddNBCToRatingPeriod < ActiveRecord::Migration
  def change
    add_reference :rating_periods, :nbc, index: true, foreign_key: true
  end
end
