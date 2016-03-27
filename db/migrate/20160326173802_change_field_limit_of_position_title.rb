class ChangeFieldLimitOfPositionTitle < ActiveRecord::Migration
  def change
    change_column :employee_work_experiences, :position_title, :string, limit: 50, null: false
  end
end
