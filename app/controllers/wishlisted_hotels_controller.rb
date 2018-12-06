class WishlistedHotelsController < ApplicationController

  def create
    user = User.find(params["user"]["id"])
    if params['hotel'].kind_of?(Array)
      params['hotel'].each do |hotel|
        hotel_instance = Hotel.find(hotel['hotel_id'])
        wlh = WishlistedHotel.create(user_id: user.id, hotel_id: hotel_instance.id, note: hotel['note'])
        wlh.create_checklist_items(hotel['checklist_items'])
      end
      render json: user.wishlisted_hotels
    else
      hotel = Hotel.find(params["hotel"]["id"])
      wlh = WishlistedHotel.create(user_id: user.id, hotel_id: hotel.id)
      wlh.create_checklist_items
      render json: user.wishlisted_hotels
    end
  end



  def destroy
    WishlistedHotel.find(params[:id]).destroy
  end

  def update
    @wlh = WishlistedHotel.find(params[:id])
    if @wlh.update({note: params[:note]})
      @wlh.update_checklist(request.parameters[:checklist_items])
      render json: @wlh
    else
      render json: @wlh.errors
    end
  end

end
