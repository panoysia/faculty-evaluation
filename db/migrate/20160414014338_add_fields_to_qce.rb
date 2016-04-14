class AddFieldsToQCE < ActiveRecord::Migration
  def change
    # boolean fields to hold status of QCE
    add_column :qces, :has_assigned_self_rating, :integer
    add_column :qces, :has_assigned_supervisor_rating, :integer
    add_column :qces, :has_assigned_peer_rating, :integer
    add_column :qces, :has_assigned_student_rating, :integer
  end
end
