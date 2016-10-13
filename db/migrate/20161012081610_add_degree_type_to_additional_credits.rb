class AddDegreeTypeToAdditionalCredits < ActiveRecord::Migration
  DOCTORATE = 0
  MASTERS = 1

  def change
    add_column :employee_additional_credits, :degree_type, :integer,
                null: false, default: MASTERS
  end
end
