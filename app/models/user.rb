class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :name,  uniqueness: true

  # 登録時にemailを不要とする
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  has_many :boards, dependent: :destroy
end
