class ChangeCompanyToSponsoringAgency < ActiveRecord::Migration
  def change
    rename_column :career_path_actions, :company, :sponsoring_agency
  end
end
