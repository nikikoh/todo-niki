class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  has_rich_text :content

  validates :title,   presence: true
end
