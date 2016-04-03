class RemoveDegreeTypeFromEmployeeEducations < ActiveRecord::Migration
  def up
    remove_column :employee_educations, :degreet_type
    remove_column :employee_educations, :degree_type
  end

  def down
    add_column :employee_educations, :degreet_type, :string
    add_column :employee_educations, :degree_type, :string
  end
end
