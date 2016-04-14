class ChangeFieldsInCareerPathActions < ActiveRecord::Migration
  def change
    # uncomment:
    remove_column :events, :type, :integer, null: false
    # rename_column :events, :type, :category     
  end
end
