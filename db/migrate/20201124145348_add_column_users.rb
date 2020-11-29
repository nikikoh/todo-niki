class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remember_created_at, :datetime
    add_column :users, :user_id, :string, null: false, default: ''
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
