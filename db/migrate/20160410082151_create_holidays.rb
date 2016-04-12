class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name, null: false
      t.date :occurs_at, null: false
      #t.date :end_at

      t.timestamps null: false
    end
  end
end
