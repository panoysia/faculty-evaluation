class RenameSequenceToPosition < ActiveRecord::Migration
  def change
    rename_column :academic_rankings, :sequence, :position
  end
end
