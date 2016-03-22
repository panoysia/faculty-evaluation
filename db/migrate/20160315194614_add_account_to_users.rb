class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :account, polymorphic: true, index: true
    # change_column_null :users, :account_id, false
    # change_column_null :users, :account_type, false
  end
end
