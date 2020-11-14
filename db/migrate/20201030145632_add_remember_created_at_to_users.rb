class AddRememberCreatedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :datetime, :string
  end
end
