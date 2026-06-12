class Post < ApplicationRecord
  enum :status, { draft: 0, published: 1, inactive: 2 }

  has_and_belongs_to_many :categories
end
