class AddHiredDateToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :hired_date, :date, null: true
  end
end
