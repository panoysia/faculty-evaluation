class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :filed_at, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.integer :length, null: false
      t.references :employee, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
