class CreateEmployeeAdditionalCredits < ActiveRecord::Migration
  def change
    create_table :employee_additional_credits do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      
      t.string :institution, limit: 50, null: false
      t.string :degree, limit: 50, null: false

      t.integer :no_of_units, null: false

      t.timestamps null: false
    end
  end
end
