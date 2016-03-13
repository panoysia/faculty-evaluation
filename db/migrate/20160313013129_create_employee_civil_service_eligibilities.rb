class CreateEmployeeCivilServiceEligibilities < ActiveRecord::Migration
  def change
    create_table :employee_civil_service_eligibilities do |t|
      t.string :career_service, limit: 30, null: false
      t.float :rating, limit: 24, null: false
      t.date :date_of_exam, null: false
      t.string :place_of_exam, limit:50
      t.string  :license_number, limit: 15
      t.date :date_release_of_license
      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end