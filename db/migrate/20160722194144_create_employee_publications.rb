class CreateEmployeePublications < ActiveRecord::Migration
  def change
    create_table :employee_publications do |t|
      t.string :title, null: false
      t.integer :nature, null: false
      t.integer :role, null: false
      t.integer :academic_level, null: false
      t.string :publisher
      t.date :date_of_publication, null: false

      t.timestamps null: false
    end
  end
end
