class CreateCCEScoringGuides < ActiveRecord::Migration
  def change
    create_table :cce_scoring_guides do |t|
      t.string :description, null: false
      t.integer :criteria, null: false
      t.decimal :points, precision: 5, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
