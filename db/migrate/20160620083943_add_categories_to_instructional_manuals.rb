class AddCategoriesToInstructionalManuals < ActiveRecord::Migration
  def change
    add_column :employee_instructional_manuals, :category, :integer
  end
end
