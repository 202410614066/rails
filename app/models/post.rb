class Post < ApplicationRecord
  enum :status, { draft: 0, published: 1, inactive: 2 }

  has_and_belongs_to_many :categories

  normalizes :title, with: -> title { title.squish.titlecase }

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :article, presence: true, length: { maximum: 65_535 }
  validates :status, inclusion: { in: statuses.keys }
end
