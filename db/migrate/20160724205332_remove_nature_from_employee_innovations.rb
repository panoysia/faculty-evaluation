class RemoveNatureFromEmployeeInnovations < ActiveRecord::Migration
  def change
    remove_column :employee_innovations, :nature, :integer
    change_column :employee_innovations, :year_patented, :integer, null: false
  end
end
