# frozen_string_literal: true
class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      #null: falseにするとnot nullエラー発生
      t.string :name, null: false
      t.string :encrypted_password, null: false, default: ''
    end
  end
end