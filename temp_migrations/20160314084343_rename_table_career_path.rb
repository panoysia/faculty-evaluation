class RenameTableCareerPath < ActiveRecord::Migration
  def change
    rename_table :career_path, :career_paths
  end
end
