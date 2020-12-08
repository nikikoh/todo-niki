class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :board_id, :integer
  end
end
