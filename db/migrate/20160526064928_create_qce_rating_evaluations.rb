class CreateQCERatingEvaluations < ActiveRecord::Migration
  def change
    create_table :qce_rating_evaluations do |t|
      t.references :qce_question, index: true, foreign_key: true, null: false
      t.integer :score
      t.references :rating, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
