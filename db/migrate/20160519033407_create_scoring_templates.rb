class CreateScoringTemplates < ActiveRecord::Migration
  def change
    create_table :scoring_templates do |t|
      t.string :question, null: false
      t.integer :sequence, null: false
      t.string :rating_type, null: false
      t.string :instrument, null: false

      t.timestamps null: false
    end
  end
end