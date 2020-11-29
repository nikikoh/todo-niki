class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:user_id]

  validates :name,  uniqueness: true

  # usernameを必須とする
  validates_uniqueness_of :name
  validates_presence_of :name

  # ユーザーとボードの紐付け
  def board_id
    Board.where(user_id: current_user.id)
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

  has_many :boards, dependent: :destroy
end
