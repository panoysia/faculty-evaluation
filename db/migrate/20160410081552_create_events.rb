class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :start_at
      t.date :end_at
      t.string :description
      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
