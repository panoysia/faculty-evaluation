class ModifyEmployeeInstructionalManuals < ActiveRecord::Migration
  def change
    remove_column :employee_instructional_manuals, :level, :integer
    add_column :employee_instructional_manuals, :description, :string, limit: 150, default: ''
    change_column_null :employee_instructional_manuals, :description, false
  end
end
