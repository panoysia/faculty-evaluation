class CreateEmployeeAccreditationServices < ActiveRecord::Migration
  def change
    create_table :employee_accreditation_services do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :name, limit: 150, null: false
      t.integer :participation, null: false

      t.date :start_at, null: false
      t.date :end_at, null: false
      t.boolean :is_current, null: false, default: false

      t.integer :no_of_years, null: false

      t.timestamps null: false
    end
  end
end
