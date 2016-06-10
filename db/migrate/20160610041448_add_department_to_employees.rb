class AddDepartmentToEmployees < ActiveRecord::Migration
  def change
    # add_reference :employees, :department, index: true, foreign_key: true, null: false , default: 0

    add_reference :employees, :department, index: true, foreign_key: true

  end
end
