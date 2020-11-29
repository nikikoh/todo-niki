class Board < ApplicationRecord
  belongs_to :user

  def user
    User.find(id: current_user.id)
  end
end
