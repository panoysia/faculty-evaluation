class CreateEmployeeAwards < ActiveRecord::Migration
  def change
    create_table :employee_awards do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :name, limit: 150, null: false
      t.integer :level, null: false
      t.date :date_awarded, null: false
      t.string :description, limit: 150, null: false, default: ""

      t.timestamps null: false
    end

    change_column_null :employee_awards, :employee_id, false
  end
end
