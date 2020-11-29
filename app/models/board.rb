class Board < ApplicationRecord
  belongs_to :user
  
  def user
    User.find(user_id)
  end
end
