# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :encrypted_password, null: false, default: ''
      t.string :name,               null: false, default: ''
    end
  end
end
