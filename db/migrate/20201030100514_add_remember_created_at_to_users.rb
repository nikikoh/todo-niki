class AddRememberCreatedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :remember_created_at, :datetime
  end
end
