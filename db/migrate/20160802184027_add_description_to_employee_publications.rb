class AddDescriptionToEmployeePublications < ActiveRecord::Migration
  def change
    add_column :employee_publications, :description, :string, limit: 150, null: false, default: ''
  end
end
