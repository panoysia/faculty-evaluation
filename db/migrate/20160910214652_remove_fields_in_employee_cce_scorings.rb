class RemoveFieldsInEmployeeCCEScorings < ActiveRecord::Migration
  def up
    remove_column :employee_cce_scorings, :cce_scoring_guide_id, :integer
    remove_column :employee_cce_scorings, :criteria, :integer
  end

  def down    
    add_column :employee_cce_scorings, :criteria, :integer
    add_column :employee_cce_scorings, :cce_scoring_guide_id, :integer

    add_index :employee_cce_scorings, :cce_scoring_guide_id
  end

end
