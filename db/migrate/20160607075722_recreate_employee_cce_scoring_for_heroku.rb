class RecreateEmployeeCCEScoringForHeroku < ActiveRecord::Migration
  def change
    create_table :employee_cce_scorings do |t|
      t.references :employee, foreign_key: true, null: false
      t.index :employee_id,
              name: 'idx_employee_id_on_employee_cce_scorings'

      t.references :cce_scorable, polymorphic: true, null: false
      t.index [:cce_scorable_type, :cce_scorable_id],
              name: 'idx_cce_scorable_on_employee_cce_scorings'

      t.references :nbc, foreign_key: true,
                  index: { name: 'idx_nbc_id_on_employee_cce_scorings' }
      
      idx_name = "idx_cce_scoring_guide_id_on_employee_cce_scorings"
      t.references :cce_scoring_guide, foreign_key: true,
                    index: { name: idx_name }, null: false

      t.decimal :score, precision: 5, scale: 2, null: false
      t.integer :criteria, null: false
      t.string :supporting_description

      t.timestamps null: false
    end
    
  end
end
