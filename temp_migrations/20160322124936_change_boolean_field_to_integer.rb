class ChangeBooleanFieldToInteger < ActiveRecord::Migration
  def change
    change_column :employee_work_experiences, :is_gov_service, :integer, limit: 1
  end
end
