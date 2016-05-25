class RenameEvaluatorSubtypeField < ActiveRecord::Migration
  def change
    rename_column :qce_instruction_ratings, :evaluator_subtype, :evaluation_category
  end
end
