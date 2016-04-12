class AddIsWeekendToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :is_weekend, :integer, null: false, default: 0
  end
end
