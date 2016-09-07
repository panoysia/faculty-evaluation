class CreateEmployeeAcademicWorkExperiences < ActiveRecord::Migration
  def change
    create_table :employee_academic_work_experiences do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      
      t.date :start_at, null: false
      t.date :end_at, null: false

      t.string :position, limit: 50, null: false
      
      t.string :institution, limit: 75, null: false
      t.integer :institution_type, null: false

      t.timestamps null: false
    end
  end
end
