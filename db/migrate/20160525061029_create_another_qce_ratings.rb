class CreateAnotherQCERatings < ActiveRecord::Migration
  def change
    create_table :qce_ratings do |t|
      t.references :qce, index: true, foreign_key: true, null: false
      t.string :type, null: false

      t.references :evaluator, polymorphic: true, index: true, null: false
      t.string :evaluator_name
      t.string :evaluator_position
      t.string :evaluation_context
      t.date :finished_at

      t.timestamps null: false
    end
  end
end
