class CreateEmployeeRankings < ActiveRecord::Migration
  def change
    create_table :employee_rankings do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :nbc, index: true, foreign_key: true
      t.integer :cce_total_points, null: false
      t.integer :qce_total_points, null: false
      t.string :current_rank, null: false
      t.string :achieved_rank

      t.timestamps null: false
    end
  end
end
