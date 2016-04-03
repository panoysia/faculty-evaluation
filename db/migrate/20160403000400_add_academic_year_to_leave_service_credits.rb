class AddAcademicYearToLeaveServiceCredits < ActiveRecord::Migration
  def change
    add_reference :leave_service_credits, :academic_year, index: true, foreign_key: true
  end
end
