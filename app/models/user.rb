class User < ApplicationRecord
  attr_accessor :name, :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user, dependent: :destroy
  has_many :boards, dependent: :destroy

  def will_save_change_to_email?
    false
  end
end
