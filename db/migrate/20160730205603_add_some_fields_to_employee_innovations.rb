class AddSomeFieldsToEmployeeInnovations < ActiveRecord::Migration
  def change
    add_column :employee_innovations, :name, :string
    change_column_null :employee_innovations, :name, false

    add_column :employee_innovations, :criteria, :integer
    change_column_null :employee_innovations, :criteria, false
  end
end
