class CreateEmployeeInnovationsCriteriaJoinTable < ActiveRecord::Migration
  def change
    create_join_table :employee_innovations, :innovation_criteria,
      table_name: 'employee_innovations_criteria' do |t|
        t.index :employee_innovation_id,
                name: 'idx_eic_on_employee_innovation_id'
        t.index :innovation_criterium_id,
                name: 'idx_eic_on_innovation_criterium_id'

      # 'eic' is short for 'employee_innovations_criteria'

      # t.index [:employee_innovation_id, :innovation_criterium_id]
      # t.index [:innovation_criterium_id, :employee_innovation_id]
    end    
  end
end
