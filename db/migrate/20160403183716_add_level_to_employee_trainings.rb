class AddLevelToEmployeeTrainings < ActiveRecord::Migration
  def change
    add_column :employee_trainings, :level, :integer
    change_column_null :employee_trainings, :level, false
  end
end
