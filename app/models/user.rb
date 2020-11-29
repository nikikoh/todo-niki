class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:user_id]

  validates :name,  uniqueness: true

  # user_idを必須とする
  validates_uniqueness_of :user_id
  validates_presence_of :user_id

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
