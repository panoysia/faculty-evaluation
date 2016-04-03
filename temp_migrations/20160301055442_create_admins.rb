class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username, limit: 20, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
    add_index :admins, :username, unique: true
  end
end
