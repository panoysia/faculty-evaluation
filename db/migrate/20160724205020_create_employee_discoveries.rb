class CreateEmployeeDiscoveries < ActiveRecord::Migration
  def change
    create_table :employee_discoveries do |t|
      t.string :patent_no, null: false
      t.integer :year_patented, null: false
      t.string :description, limit: 150
      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
