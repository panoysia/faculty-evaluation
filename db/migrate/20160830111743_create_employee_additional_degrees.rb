class CreateEmployeeAdditionalDegrees < ActiveRecord::Migration
  def change
    create_table :employee_additional_degrees do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      
      t.string :institution, limit: 50, null: false
      t.string :degree, limit: 50, null: false
      
      t.integer :degree_type, null: false
      
      t.date :start_at, null: false
      t.date :end_at, null: false
      
      t.date :graduated_at

      t.timestamps null: false
    end
  end
end
