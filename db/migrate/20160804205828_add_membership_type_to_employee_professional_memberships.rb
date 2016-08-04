class AddMembershipTypeToEmployeeProfessionalMemberships < ActiveRecord::Migration
  def change
    add_column :employee_professional_memberships, :membership_type, :integer
  end
end
