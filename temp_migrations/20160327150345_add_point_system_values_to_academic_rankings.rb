class AddPointSystemValuesToAcademicRankings < ActiveRecord::Migration
  def change
    add_column :academic_rankings, :cce_min_points, :integer
    add_column :academic_rankings, :cce_max_points, :integer
    add_column :academic_rankings, :qce_min_points, :integer
    add_column :academic_rankings, :qce_max_points, :integer
  end
end
