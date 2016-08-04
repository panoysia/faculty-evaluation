class CreateEmployeeAcademicHonors < ActiveRecord::Migration
  def change
    create_table :employee_academic_honors do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :award, limit: 150, null: false
      t.integer :degree_type, null: false
      t.integer :honor_type, null: false
      
      # 'school' or 'agency'
      t.string :school, limit: 150, null: false
      t.date :date_awarded, null: false

      t.timestamps null: false
    end
  end
end
