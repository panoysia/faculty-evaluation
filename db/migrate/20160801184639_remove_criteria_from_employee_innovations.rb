class RemoveCriteriaFromEmployeeInnovations < ActiveRecord::Migration
  def change
    remove_column :employee_innovations, :criteria, :integer
  end
end
