class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 20, null: false
      t.string :password_digest, null: false
      
      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
