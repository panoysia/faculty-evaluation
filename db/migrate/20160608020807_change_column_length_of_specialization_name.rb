class ChangeColumnLengthOfSpecializationName < ActiveRecord::Migration
  def change
    change_column :specializations, :name, :string, null: false, limit: 200
  end
end
