class AddSpecializationToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :specialization, index: true, foreign_key: true
  end
end
