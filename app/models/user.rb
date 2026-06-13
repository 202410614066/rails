class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  extend FriendlyId
  friendly_id :username, use: :slugged

  enum :gender, {
    secret: 0,
    male: 1,
    female: 2
  }

  normalizes :firstname, with: -> firstname { firstname.squish.titlecase }
  normalizes :lastname, with: -> lastname { lastname.squish.titlecase }

  validates :firstname, presence: true, length: { maximum: 255 }
  validates :lastname, presence: true, length: { maximum: 255 }
  validates :username, presence: true, length: { maximum: 32 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :gender, inclusion: { in: genders.keys }

  def fullname
    "#{firstname} #{lastname}"
  end
end
