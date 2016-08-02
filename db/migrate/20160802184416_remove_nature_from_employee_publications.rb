class RemoveNatureFromEmployeePublications < ActiveRecord::Migration
  def change
    remove_column :employee_publications, :nature, :integer
  end
end
