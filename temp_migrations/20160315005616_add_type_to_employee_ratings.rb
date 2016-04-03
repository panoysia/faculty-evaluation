class AddTypeToEmployeeRatings < ActiveRecord::Migration
  def change
    add_column :employee_ratings, :type, :string
  end
end
