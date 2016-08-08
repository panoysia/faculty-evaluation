class CreateEmployeeAcademicAdvisories < ActiveRecord::Migration
  def change
    create_table :employee_academic_advisories do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :title, limit: 150, null: false
      t.integer :nature, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false

      t.timestamps null: false
    end
  end
end
