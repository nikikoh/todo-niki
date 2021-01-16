class ContentRemoveBoard < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :content
    remove_column :tasks, :content
  end
end
