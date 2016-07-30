class AddEmployeeReferencesToTables < ActiveRecord::Migration
  def change
    # Innovation
    add_column :employee_innovations, :employee_id, :integer
    add_index :employee_innovations, :employee_id, name: 'idx_emp_innovations_on_emp_id'
    change_column_null :employee_innovations, :employee_id, false 

    # Publication
    add_column :employee_publications, :employee_id, :integer
    add_index :employee_publications, :employee_id, name: 'idx_emp_publications_on_emp_id'    
    change_column_null :employee_publications, :employee_id, false 

    # Technical Article
    add_column :employee_technical_articles, :employee_id, :integer
    add_index :employee_technical_articles, :employee_id, name: 'idx_emp_technical_articles_on_emp_id'        
    change_column_null :employee_technical_articles, :employee_id, false 

    # Instructional Manual
    add_column :employee_instructional_manuals, :employee_id, :integer
    add_index :employee_instructional_manuals, :employee_id, name: 'idx_emp_instructioinal_manuals_on_emp_id'            
    change_column_null :employee_instructional_manuals, :employee_id, false     
  end
end
