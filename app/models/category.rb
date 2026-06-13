class Category < ApplicationRecord
  has_and_belongs_to_many :posts

  normalizes :name, with: -> name { name.squish.titleize }

  validates :name, presence: true
end
