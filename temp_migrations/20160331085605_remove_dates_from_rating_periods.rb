class RemoveDatesFromRatingPeriods < ActiveRecord::Migration
  def change
    remove_column :rating_periods, :start_at
    remove_column :rating_periods, :end_at
  end
end
