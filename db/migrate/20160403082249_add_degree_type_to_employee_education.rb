class AddDegreeTypeToEmployeeEducation < ActiveRecord::Migration
  def change
    add_column :employee_educations, :degree_type, :string, limit: 1
  end
end
