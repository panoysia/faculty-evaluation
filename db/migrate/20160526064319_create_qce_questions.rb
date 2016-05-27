class CreateQCEQuestions < ActiveRecord::Migration
  def change
    create_table :qce_questions do |t|
      t.string :question, null: false
      t.integer :sequence, null: false
      t.string :rating_type, null: false
      t.string :instrument, null: false

      t.timestamps null: false
    end
  end
end
