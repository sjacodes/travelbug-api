class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :website, :imageurl
end
