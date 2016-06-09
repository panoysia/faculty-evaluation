class TemporarilyRemoveUniqueOnSpecialization < ActiveRecord::Migration
  def change
    # remove_index :specializations, column: :name, unique: true
  end
end
