class CreateEmployeeTrainings < ActiveRecord::Migration
  def change
    create_table :employee_trainings do |t|
      t.string :title, limit: 100, null: false
      t.date :start_at
      t.date :end_at
      t.integer :no_of_hours,  limit: 2
      t.string :conducted_by, limit: 50

      t.references :employee, index: true, foreign_key: true, null: false 
      t.timestamps null: false
    end
  end  
end