class WishlistedHotelsController < ApplicationController
  
  def create
    hotel = Hotel.find(params[:hotel_id])
    user = User.find(params[:user_id])
    WishlistedHotel.create(user: user, hotel: hotel)

    render json: user.hotel
  end

  def destroy
    WishlistedHotel.find_by(user_id: params[:user_id], hotel_id: params[:hotel_id]).destroy
  end
end
