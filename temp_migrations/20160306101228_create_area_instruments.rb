class CreateAreaInstruments < ActiveRecord::Migration
  def change
    create_table :area_instruments do |t|
      t.string :area, limit: 50 ,null: false
      t.string :instrument, limit: 50, null: false

      t.timestamps null: false
    end
  end
end
