class AddParticipationToEmployeeCommunityOutreaches < ActiveRecord::Migration
  def change
    add_column :employee_community_outreaches, :participation, :string, limit: 100, null: false, default: ""
  end
end
