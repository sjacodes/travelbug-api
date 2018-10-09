class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :wishlistedHotels

  def wishlistedHotels
    object.findUsersWishListedHotels
  end
  
end
