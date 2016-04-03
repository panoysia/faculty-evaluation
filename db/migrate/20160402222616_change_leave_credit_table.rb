class ChangeLeaveCreditTable < ActiveRecord::Migration
  def change
    rename_table :leave_credits, :leave_service_credits
  end
end
