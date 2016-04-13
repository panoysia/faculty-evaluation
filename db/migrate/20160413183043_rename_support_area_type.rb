class RenameSupportAreaType < ActiveRecord::Migration
  def change
    
    remove_column :qces, :support_area_type, :string
    
    change_table :qces do |t|
      t.references :support_rating, polymorphic:true
    end
  end
end
