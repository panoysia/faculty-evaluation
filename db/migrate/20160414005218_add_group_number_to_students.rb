class AddGroupNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :group_no, :integer
  end
end
