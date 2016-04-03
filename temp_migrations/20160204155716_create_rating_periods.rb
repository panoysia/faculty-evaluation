class CreateRatingPeriods < ActiveRecord::Migration
  def change
    create_table :rating_periods do |t|
      t.integer :start_at, null: false
      t.integer :end_at, null: false
      t.string :semester, limit: 1, null: false
      # semester: '1' = 1st Sem., '2' = 2nd Sem., 's' = summer
      
      t.integer :status, default: 1, null: false
      # enum status: { open: 1, close: 2 }

      t.timestamps null: false
    end
  end
end