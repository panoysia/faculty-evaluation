class RemoveIscurrentColumns < ActiveRecord::Migration
  def change
    remove_column :employee_accreditation_services, :is_current, :boolean
    remove_column :employee_accreditation_services, :no_of_years, :boolean

    remove_column :employee_assessor_services, :is_current, :boolean
    remove_column :employee_assessor_services, :no_of_years, :boolean
    change_column_null :employee_assessor_services, :end_at, false

    remove_column :employee_trainer_services, :is_current, :boolean
    remove_column :employee_trainer_services, :no_of_years, :integer
    change_column_null :employee_trainer_services, :end_at, false
  end
end
