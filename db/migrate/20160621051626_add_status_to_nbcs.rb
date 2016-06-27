class AddStatusToNBCs < ActiveRecord::Migration
  # Values for the :status field:
  CLOSE = 0
  OPEN = 1

  def change
    add_column :nbcs, :status, :integer, default: OPEN, null: false
  end
end
