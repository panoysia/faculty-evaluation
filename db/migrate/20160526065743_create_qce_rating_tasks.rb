class CreateQCERatingTasks < ActiveRecord::Migration
  def change
    create_table :qce_rating_tasks do |t|
      t.references :owner, index: true, foreign_key: true, null: false
      t.references :evaluator, polymorphic: true, index: true, null: false
      t.references :rating, polymorphic: true, index: true, null: false

      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end
