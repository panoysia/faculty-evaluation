class AddIsCommonToSpecialization < ActiveRecord::Migration
  def change
    # 'is_common' column renamed to 'is_generalize'
    add_column :specializations, :is_generalize, :integer, default: 0
  end
end
