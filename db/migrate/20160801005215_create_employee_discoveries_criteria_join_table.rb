class CreateEmployeeDiscoveriesCriteriaJoinTable < ActiveRecord::Migration
  def change
    create_join_table :employee_discoveries, :discovery_criteria,
      table_name: 'employee_discoveries_criteria' do |t|
        t.index :employee_discovery_id,
                name: 'idx_edc_on_employee_discovery_id'
        t.index :discovery_criterium_id,
                name: 'idx_edc_on_discovery_criterium_id'

      # 'edc' is short for 'employee_discoveries_criteria'

      # t.index [:employee_discovery_id, :discovery_criterium_id]
      # t.index [:discovery_criterium_id, :employee_discovery_id]
    end
  end
end
