class CreateEmployeeRatings < ActiveRecord::Migration
  def change
    create_table :employee_ratings do |t|
      t.references :rating_period, index: true, foreign_key: true, null: false
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :project_title, null: false

      t.timestamps null: false
    end
  end
end
