class RemoveNatureFromEmployeeInnovations < ActiveRecord::Migration
  def change
    remove_column :employee_innovations, :nature, :integer
    remove_column :employee_innovations, :year_patented, :date
    
    add_column :employee_innovations, :year_patented, :integer
    change_column_null :employee_innovations, :year_patented, false
    # change_column :employee_innovations, :year_patented, :integer, null: false
  end
end
