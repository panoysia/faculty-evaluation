class ChangeSemesterToInteger < ActiveRecord::Migration
  def up
    change_column :rating_periods, :semester, :integer, null: false
  end

  def down
    change_column :rating_periods, :semester, :string, limit: 1, null: false
  end
end
