class User < ApplicationRecord
  has_many :wishlisted_hotels
  has_many :hotels, through: :wishlisted_hotels
  has_secure_password
  validates :email, presence: true, uniqueness: true


  def findUsersWishListedHotels
    id_array = WishlistedHotels.all.select{|wishlistedhotel| wishlistedhotel.user_id == self.id}.map{|wishlistedhotel| wishlistedhotel.hotel_id}
    id_array.map do |arr_id|
      Hotel.all.find{|hotel|hotel.id ==arr_id}
    end
  end




end
