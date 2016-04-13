class AddCompleteFieldToQCERatings < ActiveRecord::Migration
  def change
    add_column :qce_ratings, :completed, :integer, null: false, default: 0
  end
end
