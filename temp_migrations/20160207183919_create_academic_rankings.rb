class CreateAcademicRankings < ActiveRecord::Migration
  def change
    create_table :academic_rankings do |t|
      t.string :rank, limit: 50, null: false
      t.integer :sequence, limit: 1, null: false

      t.timestamps null: false
    end
  end
end