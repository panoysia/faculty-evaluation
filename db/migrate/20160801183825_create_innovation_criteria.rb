class CreateInnovationCriteria < ActiveRecord::Migration
  def change
    create_table :innovation_criteria do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
