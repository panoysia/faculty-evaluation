class AddDegreeTypeToEmployeeEducations < ActiveRecord::Migration
  def change
    add_column :employee_educations, :degree_type, :string, limit: 1
    change_column_null :employee_educations, :degree_type, false
  end
end
