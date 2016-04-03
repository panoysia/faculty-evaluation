class AddAndRemoveColumnInRatingPeriods < ActiveRecord::Migration
  def change
    add_column :rating_periods, :is_current, :integer, null: false, default: 0
    remove_column :rating_periods, :status
  end
end
