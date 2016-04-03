class CreateEmployeeEducations < ActiveRecord::Migration
  def change
    create_table :employee_educations do |t|
      t.integer :level, limit: 1, null: false
      t.string :school_name, limit: 69, null: false
      t.string :degree_course, limit: 50, null: false
      t.string   :grade_units, limit: 7
      
      t.date :graduated_at  # year graduated
      t.date :start_at  # 'date from'
      t.date :end_at  # 'date to'

      t.text :honors_received, limit: 65535

      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end