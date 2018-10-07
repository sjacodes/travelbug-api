class User < ApplicationRecord
  has_many :likes
  has_one :wishlist
  has_many :hotels, through: :likes
  has_secure_password
end
