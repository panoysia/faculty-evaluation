class AgainRemoveDegreeTypeFromEmployeeEducations < ActiveRecord::Migration
  def change
    remove_column :employee_educations, :degree_type
  end
end
