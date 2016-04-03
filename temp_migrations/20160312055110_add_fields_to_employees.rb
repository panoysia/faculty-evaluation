class AddFieldsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :middle_name, :string, limit: 50
    add_column :employees, :name_extension, :string, limit: 7
    
    add_column :employees, :designation, :string

    add_column :employees, :gender, :string, limit: 1
    add_column :employees, :civil_status, :string, limit: 3
    add_column :employees, :birth_date, :date
    add_column :employees, :citizenship, :string, limit: 15
    add_column :employees, :height, :string, limit: 5
    add_column :employees, :weight, :string, limit: 5
    add_column :employees, :blood_type, :string, limit: 3
    add_column :employees, :gsis_no, :string, limit: 20
    add_column :employees, :pagibig_no, :string, limit: 20
    add_column :employees, :philhealth_no, :string, limit: 20
    add_column :employees, :sss_no, :string, limit: 15
    
    add_column :employees, :r_address, :string, limit: 70    
    add_column :employees, :r_zip_code, :string, limit: 5
    add_column :employees, :r_telephone_no, :string, limit: 15
    
    add_column :employees, :p_address, :string, limit: 70
    add_column :employees, :p_zip_code, :string, limit: 5
    add_column :employees, :p_telephone_no, :string, limit: 15    

    add_column :employees, :email_address, :string, limit: 40
    add_column :employees, :cellphone_no, :string, limit: 15
    add_column :employees, :agency_employee_no, :string, limit: 20
    add_column :employees, :tin, :string, limit: 15
  end
end  