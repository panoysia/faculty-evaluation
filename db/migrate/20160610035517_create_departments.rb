class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, limit: 40, null: false

      t.timestamps null: false
    end
    add_index :departments, :name, unique: true
  end
end
