class AddCompanyToCareerPathActions < ActiveRecord::Migration
  def change
    add_column :career_path_actions, :company, :string
  end
end
