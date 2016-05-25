class AddFinishedAtToQCEInstructionRatings < ActiveRecord::Migration
  def change
    add_column :qce_instruction_ratings, :finished_at, :date
    remove_column :qce_instruction_ratings, :rated_on, :date
  end
end
