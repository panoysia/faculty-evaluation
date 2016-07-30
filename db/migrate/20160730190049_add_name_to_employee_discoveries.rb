class AddNameToEmployeeDiscoveries < ActiveRecord::Migration
  def change
    add_column :employee_discoveries, :name, :string
    change_column_null :employee_discoveries, :name, false
  end
end
