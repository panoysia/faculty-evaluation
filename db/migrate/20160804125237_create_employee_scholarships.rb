class CreateEmployeeScholarships < ActiveRecord::Migration
  def change
    create_table :employee_scholarships do |t|
      t.references :employee, index: true, foreign_key: true

      t.string :title, limit: 150, null: false
      t.string :sponsoring_agency, limit: 150, null: false
      t.date :date_granted, null: false
      t.integer :scholarship_type, null: false
      t.integer :degree_type

      t.timestamps null: false
    end

    change_column_null :employee_scholarships, :employee_id, false
  end
end
