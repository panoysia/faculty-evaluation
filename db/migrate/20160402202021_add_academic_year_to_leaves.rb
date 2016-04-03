class AddAcademicYearToLeaves < ActiveRecord::Migration
  def change
    add_reference :leaves, :academic_year, index: true, foreign_key: true
  end
end
