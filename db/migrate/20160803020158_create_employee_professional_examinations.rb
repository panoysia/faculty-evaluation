class CreateEmployeeProfessionalExaminations < ActiveRecord::Migration
  def change
    create_table :employee_professional_examinations do |t|
      t.string :title, limit: 150, null: false
      t.string :agency_name, limit: 150, null: false
      t.date :date_passed, null: false
      t.integer :category, null: false

      t.timestamps null: false
    end
  end
end
