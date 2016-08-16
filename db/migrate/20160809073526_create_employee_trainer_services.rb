class CreateEmployeeTrainerServices < ActiveRecord::Migration
  def change
    create_table :employee_trainer_services do |t|
      t.references :employee, index: true, foreign_key: true, null: false

      t.string :name, limit: 150, null: false
      t.string :agency, limit: 150, null: false

      t.date :start_at, null: false
      t.date :end_at

      t.boolean :is_current, null: false, default: false
      t.integer :no_of_years, null: false, default: 0

      t.timestamps null: false
    end
  end
end
