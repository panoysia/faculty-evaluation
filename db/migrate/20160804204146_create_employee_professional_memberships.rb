class CreateEmployeeProfessionalMemberships < ActiveRecord::Migration
  def change
    create_table :employee_professional_memberships do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.string :organization, limit: 150, null: false
      t.date :date_of_membership, null: false
      t.integer :organization_type, null: false

      t.timestamps null: false
    end
  end
end
