class CreateEmployeeCreativeWorkCriteria < ActiveRecord::Migration
  def change
    create_table :creative_work_criteria do |t|
    # create_table :employee_creative_work_criteria do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
