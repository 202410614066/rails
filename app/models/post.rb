class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum :status, { draft: 0, published: 1, inactive: 2 }

  belongs_to :user
  has_and_belongs_to_many :categories
  has_one_attached :image
  has_rich_text :article

  normalizes :title, with: -> title { title.squish.titlecase }

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :status, inclusion: { in: statuses.keys }
end
