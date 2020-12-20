class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, uniqueness: true

  def written?(board)
    boards.exists?(id: @board)
  end

  def has_written?(board)
    tasks.exists?(board_id: @board)
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
