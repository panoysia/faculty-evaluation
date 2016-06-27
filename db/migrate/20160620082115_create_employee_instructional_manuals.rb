class CreateEmployeeInstructionalManuals < ActiveRecord::Migration
  def change
    create_table :employee_instructional_manuals do |t|
      t.string :name, limit: 50, null: false
      t.integer :level, null: false
      t.date :published_at, null: false

      t.timestamps null: false
    end
  end
end
