class HotelsController < ApplicationController

def index
  @hotels = Hotel.all
  render json: @hotels.shuffle
end

def show
  @hotel = Hotel.find(params[:id])
  render json: @hotel
end


end
