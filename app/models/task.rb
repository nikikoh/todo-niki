class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy

  has_rich_text :content

  validates :title, presence: true
end
