class CreateEmployeeInnovations < ActiveRecord::Migration
  def change
    create_table :employee_innovations do |t|
      t.string :patent_no, null: false
      t.integer :nature, null: false
      t.date :year_patented, null: false
      t.string :description, limit: 150
      
      t.timestamps null: false
    end
  end
end
