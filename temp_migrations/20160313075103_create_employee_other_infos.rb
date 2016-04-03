class CreateEmployeeOtherInfos < ActiveRecord::Migration
  def change
    create_table :employee_other_infos do |t|
      # on naming columns, the word 'context' is prefered over 'type'
      t.integer :context, limit: 1, null: false
      t.string :info, limit: 100, null: false
      
      t.references :employee, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end