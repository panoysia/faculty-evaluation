class CreateRatingScorings < ActiveRecord::Migration
  def change
    create_table :rating_scorings do |t|
      t.references :scoring_template, index: true, foreign_key: true, null: false
      t.integer :score, null: false
      t.references :rating, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
