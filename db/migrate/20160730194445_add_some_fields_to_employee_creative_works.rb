class AddSomeFieldsToEmployeeCreativeWorks < ActiveRecord::Migration
  def change
    add_column :employee_creative_works, :name, :string
    change_column_null :employee_creative_works, :name, false

    add_column :employee_creative_works, :criteria, :integer
    change_column_null :employee_creative_works, :criteria, false

    add_column :employee_creative_works, :competitiveness, :integer
    change_column_null :employee_creative_works, :competitiveness, false
  end
end
