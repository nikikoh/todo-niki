class Profile < ApplicationRecord
  attr_accessor :name, :email
  
  belong_to :user
end
