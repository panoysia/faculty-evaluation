class CreateFacultyEvaluations < ActiveRecord::Migration
  def change
    create_table :faculty_evaluations do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.references :nbc, index: true, foreign_key: true, null: false
      t.string :current_rank, null: false

      t.timestamps null: false
    end
  end
end
