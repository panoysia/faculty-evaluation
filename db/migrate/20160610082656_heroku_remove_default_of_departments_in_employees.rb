class HerokuRemoveDefaultOfDepartmentsInEmployees < ActiveRecord::Migration
  def change
    change_column_default :employees, :department_id, nil
  end
end
