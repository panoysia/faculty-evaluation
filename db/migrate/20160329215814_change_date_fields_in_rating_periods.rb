class ChangeDateFieldsInRatingPeriods < ActiveRecord::Migration
  def change
    change_column :rating_periods, :start_at, :date, null: false
    change_column :rating_periods, :end_at, :date, null: false
  end
end
