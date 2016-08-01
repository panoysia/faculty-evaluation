class RemoveCriteriaFromEmployeeDiscoveries < ActiveRecord::Migration
  def change
    remove_column :employee_discoveries, :criteria, :integer
  end
end
