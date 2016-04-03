class CreateLeaveCredits < ActiveRecord::Migration
  def change
    create_table :leave_credits do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :description
      t.date :valid_at, null: false
      t.date :expire_at, null: false

      t.timestamps null: false
    end
  end
end
