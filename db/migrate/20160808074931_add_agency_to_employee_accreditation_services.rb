class AddAgencyToEmployeeAccreditationServices < ActiveRecord::Migration
  def change
    add_column :employee_accreditation_services, :agency, :string, limit: 150, null: false, default: ""
  end
end
