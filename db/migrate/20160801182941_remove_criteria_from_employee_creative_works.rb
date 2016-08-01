class RemoveCriteriaFromEmployeeCreativeWorks < ActiveRecord::Migration
  def change
    remove_column :employee_creative_works, :criteria, :integer
  end
end
