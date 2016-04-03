class RenameColumnsInAcademicRanking < ActiveRecord::Migration
  def change
    rename_column :academic_rankings, :rank, :name
  end
end
