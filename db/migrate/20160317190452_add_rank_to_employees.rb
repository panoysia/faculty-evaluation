class AddRankToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :academic_ranking, index: true, foreign_key: true
  end
end
