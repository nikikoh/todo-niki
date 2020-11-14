class Board < ApplicationRecord
  has_one_attached :eyecatch
  attr_accessor :board

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }
  validates :title, format: { with: /\A(?!\@)/ }
  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true
  belongs_to :user

  def display_created_at
    I18n.l(created_at, format: :default)
  end

  def author_name
    user.display_name
  end

  private

  def validate_title_and_content_length
    char_count = title.length + content.length
    errors.add(:content, '100文字以上で！') unless char_count > 100
  end
end
