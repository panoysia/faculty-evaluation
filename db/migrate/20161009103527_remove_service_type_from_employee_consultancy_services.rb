class RemoveServiceTypeFromEmployeeConsultancyServices < ActiveRecord::Migration
  def change
    remove_column :employee_consultancy_services, :service_type, :integer
  end
end
