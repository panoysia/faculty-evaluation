class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.string :description, limit: 30

      t.timestamps null: false
    end
  end
end
