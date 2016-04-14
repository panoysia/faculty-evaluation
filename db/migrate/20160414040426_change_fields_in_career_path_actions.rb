class ChangeFieldsInCareerPathActions < ActiveRecord::Migration
  def change
    change_column :career_path_actions, :category, :integer
  end
end
