class RenameEventsToCareerActions < ActiveRecord::Migration
  def change
    rename_table :events, :career_path_actions
  end
end
