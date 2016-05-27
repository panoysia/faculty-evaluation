class RenameQCEQuestionId < ActiveRecord::Migration
  def change
    rename_column :qce_rating_evaluations, :qce_question_id, :question_id
  end
end
