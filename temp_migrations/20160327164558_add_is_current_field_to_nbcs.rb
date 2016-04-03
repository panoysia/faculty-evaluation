class AddIsCurrentFieldToNBCs < ActiveRecord::Migration
  def change
    add_column :nbcs, :is_current, :integer, null: false, default: 0
  end
end
