class RenameScoringTemplatesTable < ActiveRecord::Migration
  def change
    rename_table :scoring_templates, :rating_questions
  end
end
