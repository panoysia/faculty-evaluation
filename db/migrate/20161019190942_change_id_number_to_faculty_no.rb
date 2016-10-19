class ChangeIdNumberToFacultyNo < ActiveRecord::Migration
  def change
    rename_column :employees, :id_number, :faculty_no
  end
end
