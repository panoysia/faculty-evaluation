class DropSomeTables < ActiveRecord::Migration
  def change
    drop_table :area_instruments
    drop_table :employee_ratings
    
    drop_table :qce_instruction_ratings
    
    drop_table :rating_questions, force: :cascade
    drop_table :rating_scores, force: :cascade
    drop_table :rating_tasks , force: :cascade
  end
end
