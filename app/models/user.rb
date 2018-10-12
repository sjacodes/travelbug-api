class User < ApplicationRecord
  has_many :wishlisted_hotels
  has_many :hotels, through: :wishlisted_hotels
  has_secure_password
  validates :email, presence: true, uniqueness: true


  def findUsersWishListedHotels
    self.wishlisted_hotels.map do |wlh|
      wlh.hotel
    end
  end




end
