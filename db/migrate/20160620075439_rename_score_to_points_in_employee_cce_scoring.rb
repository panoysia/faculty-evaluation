class RenameScoreToPointsInEmployeeCCEScoring < ActiveRecord::Migration
  def change
    rename_column :employee_cce_scorings, :score, :points
  end
end
