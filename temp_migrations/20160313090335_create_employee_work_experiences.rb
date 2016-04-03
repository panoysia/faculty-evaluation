class CreateEmployeeWorkExperiences < ActiveRecord::Migration
  def change
    create_table :employee_work_experiences do |t|
      t.date :start_at, null: false
      t.date :end_at, null: false
      
      t.string :position_title, limit: 40, null: false
      t.string :company, limit: 50, null: false
      t.decimal :monthly_salary, precision: 10
      t.string :salary_grade, limit: 7
      t.string :status_of_appointment, limit: 20
      t.boolean :is_gov_service, limit: 1
      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end