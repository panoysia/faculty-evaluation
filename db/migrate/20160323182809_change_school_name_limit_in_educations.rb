class ChangeSchoolNameLimitInEducations < ActiveRecord::Migration
  def change
    change_column :employee_educations, :school_name, :string, limit: 50, null: false
  end
end
