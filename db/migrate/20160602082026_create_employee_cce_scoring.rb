class CreateEmployeeCCEScoring < ActiveRecord::Migration
  def change
    create_table :employee_cce_scorings do |t|
      # t.references :employee, index: true, foreign_key: true, null: false, name: 
      # t.references :cce_scoreable, polymorphic: true, index: true, null: false
      t.decimal :score, precision: 5, scale: 2, null: false
    end
  end
end
