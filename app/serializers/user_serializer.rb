class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :likedHotels

  def likedHotels
    object.findLikedHotels
  end
  
end
