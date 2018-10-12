class WishlistedHotelsController < ApplicationController
  
  def create
    hotel = Hotel.find(params["hotel"]["id"])
    user = User.find(params["user"]["id"])
    wlh = WishlistedHotel.create(user_id: user.id, hotel_id: hotel.id)
    wlh.create_checklist_items
    render json: user.wishlisted_hotels
  end

  def destroy
    WishlistedHotel.find_by(user_id: params[:user_id], hotel_id: params[:hotel_id]).destroy
  end

end
