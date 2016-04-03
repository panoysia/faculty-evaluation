class ChangeColumnDefaultInDegreeType < ActiveRecord::Migration
  def up
    change_column_null :employee_educations, :degree_type, false
  end

  def down
    change_column_null :employee_educations, :degree_type, true
  end
end
