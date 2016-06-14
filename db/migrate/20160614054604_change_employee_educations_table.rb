class ChangeEmployeeEducationsTable < ActiveRecord::Migration
  
  def self.up
    change_column :employee_educations, :grade_units, :integer
    remove_column :employee_educations, :is_recent, :integer
    remove_column :employee_educations, :points, :decimal,
                  precision: 4, scale: 2
  end

  def self.down
    add_column :employee_educations, :points, :decimal,
                  precision: 4, scale: 2
    add_column :employee_educations, :is_recent, :integer 
    change_column :employee_educations, :grade_units, :string
  end

end
