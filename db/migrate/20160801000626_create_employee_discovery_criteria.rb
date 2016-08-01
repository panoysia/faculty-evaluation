class CreateEmployeeDiscoveryCriteria < ActiveRecord::Migration
  def change
    create_table :discovery_criteria do |t|
    # create_table :employee_discovery_criteria do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
