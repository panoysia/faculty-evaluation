class AddSubrankToAcademicRankings < ActiveRecord::Migration
  def change
    add_column :academic_rankings, :subrank, :integer
  end
end
