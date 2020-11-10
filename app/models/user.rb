class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise{:database_authenticatable :registerable 
         :recoverable :rememberable :validatable}
  validates :name, presence: true # 追記
  validates :profile, length: { maximum: 200 } # 追記
end
