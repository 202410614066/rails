class Profile < ApplicationRecord
  belongs_to :user

  has_rich_text :bio

  validates :bio, presence: true
end
