class AddNumberOfDaysToLeaveServiceCredits < ActiveRecord::Migration
  def change
    add_column :leave_service_credits, :no_of_days, :integer
  end
end
