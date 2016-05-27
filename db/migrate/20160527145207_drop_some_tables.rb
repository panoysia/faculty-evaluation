class DropSomeTables < ActiveRecord::Migration
  def change
    drop_table :area_instruments
    drop_table :employee_ratings
    
    drop_table :qce_instruction_ratings
    
    drop_table :rating_questions
    drop_table :rating_scores
    drop_table :rating_tasks 
  end
end
