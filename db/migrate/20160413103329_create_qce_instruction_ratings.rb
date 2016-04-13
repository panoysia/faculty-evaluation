class CreateQCEInstructionRatings < ActiveRecord::Migration
  def change
    create_table :qce_instruction_ratings do |t|
      t.references :qce, index: true, foreign_key: true, null: false
      t.string :evaluator_type, null: false
      t.string :evaluator_name
      t.string :evaluator_position
      t.date :rated_on, null: false

      t.timestamps null: false
    end
  end
end
