class CreateEmployeeConsultancyServices < ActiveRecord::Migration
  def change
    create_table :employee_consultancy_services do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      
      t.string :title, limit: 150
      t.integer :service_type, null: false
      t.integer :level, null: false

      t.string :nature_of_participation, limit: 150,
        null: false, default: ""
        
      t.string :sponsoring_agency, limit: 150, null: false
      
      t.date :start_at, null: false
      t.date :end_at, null: false
    
      t.timestamps null: false
    end
  end
end
