class RemoveCareerPathIdInCareerPathActions < ActiveRecord::Migration
  def change
    remove_reference :career_path_actions, :career_path, index: true, foreign_key: true
    add_reference :career_path_actions, :specialization, index: true, foreign_key: true
  end
end
