class AddCareerPathToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :career_path, index: true, foreign_key: true
  end
end
