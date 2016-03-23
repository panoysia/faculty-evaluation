class ChangeSizeOfWeightField < ActiveRecord::Migration
  def change
    change_column :employees, :weight, :string, limit: 15
  end
end
