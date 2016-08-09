class ChangeParticipationInEmployeeAccreditationServices < ActiveRecord::Migration
  def up
    change_column :employee_accreditation_services, :participation, :string, limit: 150, null: false, default: ""
  end

  def down
    change_column :employee_accreditation_services, :participation, :integer, null: false  
  end
end
