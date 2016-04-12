class AddCareerPathToCareerPathActions < ActiveRecord::Migration
  def change
    add_reference :career_path_actions, :career_path, index: true, foreign_key: true
    change_column_null :career_path_actions, :career_path_id, false
  end
end
