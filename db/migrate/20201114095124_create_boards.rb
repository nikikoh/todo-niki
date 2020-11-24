class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string   :name
      t.text     :description
      t.text     :task
      t.string   :datetime
      t.references :user

      t.timestamps
    end
  end
end
