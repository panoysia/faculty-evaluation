class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false

      t.timestamps null: false
    end
  end
end