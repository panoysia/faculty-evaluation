class RemoveCareerPathColumnInEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :career_path_id, :integer
  end
end
