class AddNameToEmployeeInventions < ActiveRecord::Migration
  def change
    add_column :employee_inventions, :name, :string
    change_column_null :employee_inventions, :name, false
  end
end
