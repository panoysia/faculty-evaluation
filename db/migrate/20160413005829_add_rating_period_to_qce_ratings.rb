class AddRatingPeriodToQCERatings < ActiveRecord::Migration
  def change
    add_reference :qce_ratings, :rating_period, index: true, foreign_key: true
    change_column_null :qce_ratings, :rating_period_id, false
  end
end
