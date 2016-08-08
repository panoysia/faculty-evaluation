class CreateEmployeePRCReviews < ActiveRecord::Migration
  def change
    create_table :employee_prc_reviews do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :name, limit: 150, null: false
      t.date :occurred_at, null: false

      t.timestamps null: false
    end
  end
end
