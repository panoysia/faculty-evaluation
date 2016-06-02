class AddDefaultToQCERatingEvaluations < ActiveRecord::Migration
  def change
    change_column_default :qce_rating_evaluations, :score, 0
  end
end
