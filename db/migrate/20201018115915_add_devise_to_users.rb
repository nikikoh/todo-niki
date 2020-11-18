# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false # 追記
      t.string :encrypted_password, null: false, default: ''
    end
  end
end
