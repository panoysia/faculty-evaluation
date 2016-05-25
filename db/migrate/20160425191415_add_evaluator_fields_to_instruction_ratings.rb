class AddEvaluatorFieldsToInstructionRatings < ActiveRecord::Migration
  def change
    add_column :qce_instruction_ratings, :evaluator_id, :integer
    add_column :qce_instruction_ratings, :evaluator_subtype, :string
  end
end
