class SyncMigrationsForHeroku < ActiveRecord::Migration
  def change
    rename_column :qce_rating_tasks, :owner_id, :employee_id

    change_column_null :career_path_actions, :category, false
    change_column_null :specializations, :career_path_id, false
  end
end

  # * Add not null constraint on 'category' column 
  # create_table :career_path_actions do |t|
  #   t.integer  "category",       null: false
  #   t.integer  "category" # add null: false
  # end 

  # * Rename column 'owner_id' to 'employee_id'
  # create_table "qce_rating_tasks", force: :cascade do |t|
  #   t.integer  "employee_id",    null: false
  #   t.integer  "owner_id",       null: false
  # end    

  # * Add not null constraint on 'career_path_id' column
  # create_table "specializations", force: :cascade do |t|
  #   t.integer  "career_path_id"
  #   # t.integer  "career_path_id",            null: false
  # end  


  # add_index "qce_rating_tasks", ["employee_id"], name: "index_qce_rating_tasks_on_employee_id", using: :btree
  
  # add_index "qce_rating_tasks", ["owner_id"], name: "index_qce_rating_tasks_on_owner_id"  