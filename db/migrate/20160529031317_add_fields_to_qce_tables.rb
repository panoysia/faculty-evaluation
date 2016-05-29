class AddFieldsToQCETables < ActiveRecord::Migration
  def change
    add_column :qce_ratings, :instrument, :string
    add_column :qces, :support_area, :string
    remove_column :qces, :support_rating_id, :integer
    remove_column :qces, :support_rating_type, :string
  end
end
