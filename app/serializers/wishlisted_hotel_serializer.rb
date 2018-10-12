class WishlistedHotelSerializer < ActiveModel::Serializer
  attributes :id, :note, :hotel_id, :user_id, :imageurl 

  def imageurl
    object.hotel.imageurl
  end
end
