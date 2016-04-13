class CreateQCERatings < ActiveRecord::Migration
  def change
    create_table :qce_ratings do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.references :academic_year, index: true, foreign_key: true, null: false
      t.integer :semeseter, null: false
      t.references :nbc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
