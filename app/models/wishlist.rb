class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :hotels, through: :likes
  has_many :blades
  has_many :checklists
  has_many :notes
end
