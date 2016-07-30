class AddCriteriaToEmployeeDiscoveries < ActiveRecord::Migration
  def change
    add_column :employee_discoveries, :criteria, :integer
    change_column_null :employee_discoveries, :criteria, false
  end
end
