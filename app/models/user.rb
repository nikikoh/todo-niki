class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:user_id]

  has_many :boards, dependent: :destroy

  validates :name,  uniqueness: true

  # user_idを必須とする
  validates_uniqueness_of :user_id
  validates_presence_of :user_id

  def has_written?(board)
    boards.exists?(id: board.id)
  end
  # 登録時にemailを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
