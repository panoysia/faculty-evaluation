class CreateEmployeeCommunityOutreaches < ActiveRecord::Migration
  def change
    create_table :employee_community_outreaches do |t|
      t.string :project_name, limit: 150, null: false
      t.string :sponsoring_agency, limit: 150, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false

      t.timestamps null: false
    end
  end
end
