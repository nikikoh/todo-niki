class Profile < ApplicationRecord
    attr_accessor :name, :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true # 追記
  validates :profile, length: { maximum: 200 } # 追記

  belong_to :user
end
