class UpdateFieldsInInstructionRatings < ActiveRecord::Migration
  def change
    change_column_null :qce_instruction_ratings, :evaluator_id, false
  end
end
