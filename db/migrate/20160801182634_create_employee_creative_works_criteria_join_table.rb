class CreateEmployeeCreativeWorksCriteriaJoinTable < ActiveRecord::Migration
  def change
    create_join_table :employee_creative_works, :creative_work_criteria,
      table_name: 'employee_creative_works_criteria' do |t|
        t.index :employee_creative_work_id,
                name: 'idx_ecwc_on_employee_creative_work_id'
        t.index :creative_work_criterium_id,
                name: 'idx_ecwc_on_creative_work_criterium_id'

      # 'ecwc' is short for 'employee_creative_works_criteria'

      # t.index [:employee_creative_work_id, :creative_work_criterium_id]
      # t.index [:creative_work_criterium_id, :employee_creative_work_id]
    end    
  end
end
