class User < ApplicationRecord
  has_many :wishlistedHotels
  has_many :hotels, through: :wishlistedHotels
  has_secure_password
end
