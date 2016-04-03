class AddUniqeToSpecialzationName < ActiveRecord::Migration
  def change
    change_column :specializations, :name, :string, limit: 50
    change_column_null :specializations, :name, false
    add_index :specializations, :name, unique: true
  end
end
