class ChangeColumnSizeOfCareerPathTables < ActiveRecord::Migration
  def change    
    change_column :career_paths, :name, :string, null: false, limit: 50
    change_column :specializations, :name, :string, null: false, limit: 100

    add_index :career_paths, :name, unique: true
  end
end
