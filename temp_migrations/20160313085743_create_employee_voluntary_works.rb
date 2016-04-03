class CreateEmployeeVoluntaryWorks < ActiveRecord::Migration
  def change
    create_table :employee_voluntary_works do |t|
      t.string :organization, limit: 70, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.integer :no_of_hours, limit: 2
      t.string :position, limit: 50

      t.references :employee, index: true, foreign_key: true, null: false
      
      t.timestamps null: false
    end
  end
end