class AddReviewTypeToEmployeeProfessionalReviews < ActiveRecord::Migration
  def change
    add_column :employee_professional_reviews, :review_type, :integer
    change_column_null :employee_professional_reviews, :review_type, false
  end
end
