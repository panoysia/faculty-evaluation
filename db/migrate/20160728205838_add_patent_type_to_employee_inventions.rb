class AddPatentTypeToEmployeeInventions < ActiveRecord::Migration
  def change
    add_column :employee_inventions, :patent_type, :integer
    change_column_null :employee_inventions, :patent_type, false
  end
end
