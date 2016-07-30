class CreateEmployeeTechnicalArticles < ActiveRecord::Migration
  def change
    create_table :employee_technical_articles do |t|
      t.string :name, limit: 50, null: false
      t.integer :level, null: false
      t.date :published_at, null: false
      t.string :description, limit: 150

      t.timestamps null: false
    end
  end
end
