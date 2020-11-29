class Board < ApplicationRecord
  belongs_to :user

  def user
    User.find(id: user_id)
  end

end
