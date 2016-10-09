class AddScoreFieldsToEmployeeEvaluations < ActiveRecord::Migration
  def change
    add_column :employee_evaluations, :cce_score,
      :decimal, precision: 5, scale: 2, null: false, default: 0.00
    add_column :employee_evaluations, :qce_score,
      :decimal, precision: 5, scale: 2, null: false, default: 0.00      
  end
end
