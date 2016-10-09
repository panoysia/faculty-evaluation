class AddFieldsToEmployeeEvaluations < ActiveRecord::Migration
  def change
    add_column :employee_evaluations, :rank_before,
      :string, null: false, default: ""

    add_column :employee_evaluations, :rank_after,
      :string, null: false, default: ""
  end
end
