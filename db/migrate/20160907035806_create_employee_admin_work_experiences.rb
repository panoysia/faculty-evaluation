class CreateEmployeeAdminWorkExperiences < ActiveRecord::Migration
  def change
    create_table :employee_admin_work_experiences do |t|
      t.references :employee, index: true, foreign_key: true, null: false

      t.integer :position, null: false
      t.string :institution, limit: 75, null: false

      t.date :start_at, null: false
      t.date :end_at, null: false      

      t.timestamps null: false
    end
  end
end
