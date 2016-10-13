class AddSalaryGradeToAcademicRankings < ActiveRecord::Migration
  def change
    add_column :academic_rankings, :salary_grade, :integer
  end
end
