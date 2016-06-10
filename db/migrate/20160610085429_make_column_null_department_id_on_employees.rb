class MakeColumnNullDepartmentIdOnEmployees < ActiveRecord::Migration
  def change
    change_column_null :employees, :department_id, true
  end
end
