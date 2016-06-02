class AddNBCToAcademicYears < ActiveRecord::Migration
  def change
    add_reference :academic_years, :nbc, index: true, foreign_key: true
  end
end
