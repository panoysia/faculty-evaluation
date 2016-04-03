class RemoveIsCurrentFieldsFromTables < ActiveRecord::Migration
  def change
    remove_column :nbcs, :is_current
    remove_column :rating_periods, :is_current
  end
end
