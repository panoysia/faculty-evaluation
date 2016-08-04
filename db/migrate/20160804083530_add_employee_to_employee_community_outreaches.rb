class AddEmployeeToEmployeeCommunityOutreaches < ActiveRecord::Migration
  def change
    add_reference :employee_community_outreaches, :employee, index: true, foreign_key: true
    change_column_null :employee_community_outreaches, :employee_id, false
  end
end
