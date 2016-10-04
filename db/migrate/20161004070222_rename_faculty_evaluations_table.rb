class RenameFacultyEvaluationsTable < ActiveRecord::Migration
  def change
    rename_table :faculty_evaluations, :employee_evaluations
  end
end
