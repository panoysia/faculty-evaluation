class AddCareerPathToSpecialization < ActiveRecord::Migration
  def change
    add_reference :specializations, :career_path,
            index: true, foreign_key: true
    change_column_null :specializations, :career_path_id, true
  end
end
