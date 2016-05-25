class SetScoreToNullByDefault < ActiveRecord::Migration
  def change
    change_column_null :rating_scores, :score, true
  end
end
