class RenameRatingScoringsTable < ActiveRecord::Migration
  def change
    rename_table :rating_scorings, :rating_scores
    rename_column :rating_scores, :scoring_template_id, :question_id
  end
end
