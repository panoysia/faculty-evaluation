class MakeSpecializationNotNull < ActiveRecord::Migration
  def change
    change_column_null :career_path_actions, :specialization_id, false
  end
end
