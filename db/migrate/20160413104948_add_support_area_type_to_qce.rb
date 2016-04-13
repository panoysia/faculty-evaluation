class AddSupportAreaTypeToQCE < ActiveRecord::Migration
  def change
    add_column :qces, :support_area_type, :string
  end
end
