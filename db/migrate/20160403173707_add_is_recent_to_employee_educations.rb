class AddIsRecentToEmployeeEducations < ActiveRecord::Migration
  def change
    add_column :employee_educations, :is_recent, :int
  end
end
