class RemoveColumnsInQCERatings < ActiveRecord::Migration
  def change
    remove_column :qce_ratings, :academic_year_id, :integer
    remove_column :qce_ratings, :semeseter, :integer
    remove_column :qce_ratings, :nbc_id, :integer
    remove_column :qce_ratings, :rating_period_id, :integer
  end
end
