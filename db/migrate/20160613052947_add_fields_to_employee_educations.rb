class AddFieldsToEmployeeEducations < ActiveRecord::Migration
  def change
    add_column :employee_educations, :attainment_level, :integer, index: true
    add_index :employee_educations, :attainment_level

    add_column :employee_educations, :criteria, :integer, index: true
    add_index :employee_educations, :criteria 
  end
end
