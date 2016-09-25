class AddCriteriaToDiscoveryCriteria < ActiveRecord::Migration
  def up
    add_column :discovery_criteria, :criteria, :integer

    execute "UPDATE discovery_criteria SET criteria = 1 WHERE id = 1;"
    execute "UPDATE discovery_criteria SET criteria = 2 WHERE id = 2;"
  
    change_column_null :discovery_criteria, :criteria, false
  end

  def down
    remove_column :discovery_criteria, :criteria, :integer    
  end
end
