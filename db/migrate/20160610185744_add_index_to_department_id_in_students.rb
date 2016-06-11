class AddIndexToDepartmentIdInStudents < ActiveRecord::Migration
  def change
    add_index :students, :department_id
  end
end
