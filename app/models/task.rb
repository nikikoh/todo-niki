class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board, optional: true

  validates :title, presence: true
  validates :content, presence: true
end
