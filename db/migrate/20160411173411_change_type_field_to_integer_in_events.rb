class ChangeTypeFieldToIntegerInEvents < ActiveRecord::Migration
  def change
    change_column :events, :type, :integer, null: false
    rename_column :events, :type, :category 
  end
end
