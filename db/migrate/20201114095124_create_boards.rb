class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string   :name
      t.string   :avatar
      t.text     :description
      t.integer  :user_id
      t.text     :state
      t.text     :task
      t.date     :limit_date

      t.timestamps
    end
  end
end
