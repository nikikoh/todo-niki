class AddRememberCreatedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remember_created_at, :datetime, :string
  end
end
