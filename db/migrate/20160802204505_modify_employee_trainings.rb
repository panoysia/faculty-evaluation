class ModifyEmployeeTrainings < ActiveRecord::Migration
  def change
    rename_column :employee_trainings, :no_of_hours, :no_of_days
    
    change_column_null :employee_trainings, :start_at, false
    change_column_null :employee_trainings, :end_at, false
    change_column_null :employee_trainings, :conducted_by, false
    
    add_column :employee_trainings, :nature_of_participation, :string, default: ""
    change_column_null :employee_trainings, :nature_of_participation, false


    add_column :employee_trainings, :category, :integer
    connection.update(<<-SQL)
      UPDATE employee_trainings SET category = 0
    SQL

    change_column_null :employee_trainings, :category, false

  end
end
