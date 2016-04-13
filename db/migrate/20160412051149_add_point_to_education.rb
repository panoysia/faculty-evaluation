class AddPointToEducation < ActiveRecord::Migration
  def change
    add_column :employee_educations, :points, :decimal, precision: 4, scale: 2
  end
end
