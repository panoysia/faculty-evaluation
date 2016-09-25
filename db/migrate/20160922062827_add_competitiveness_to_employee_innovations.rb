class AddCompetitivenessToEmployeeInnovations < ActiveRecord::Migration
  def change
    add_column :employee_innovations, :competitiveness, :integer
    change_column_null :employee_innovations, :competitiveness, false
  end
end
