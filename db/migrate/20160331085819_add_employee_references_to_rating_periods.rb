class AddEmployeeReferencesToRatingPeriods < ActiveRecord::Migration
  # actually its add academic_year
  def change
    add_reference :rating_periods, :academic_year, index: true, foreign_key: true
  end
end
