class ChangeGroupNoToDepartmentIdInStudents < ActiveRecord::Migration
  def change
    remove_column :students, :group_no, :integer
    add_column :students, :department_id, :integer
  end
end
