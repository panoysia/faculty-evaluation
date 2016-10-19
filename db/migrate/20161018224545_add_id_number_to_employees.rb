class AddIdNumberToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :id_number, :string, default: "", null: false
  end
end
