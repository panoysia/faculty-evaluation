class RenameEmployeePRCReviewsToEmployeeProfessionalReviews < ActiveRecord::Migration
  def change
    rename_table :employee_prc_reviews, :employee_professional_reviews
  end
end
