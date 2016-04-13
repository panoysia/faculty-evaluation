class ChangeQCERatingsToQCEs < ActiveRecord::Migration
  def change
    rename_table :qce_ratings, :qces
  end
end
