class LikesController < ApplicationController

  def index
    @like = Like.all
    render json: @like
  end

  def show
    @like = Like.find(params[:id])
    render json: @like
  end

  def create
    hotel = Hotel.find(params[:hotel_id])
    user = User.find(params[:user_id])
    Like.create(user: user, hotel: hotel)

    render json: user.hotels
  end

  def destroy
    Like.find_by(user_id: params[:user_id], hotel_id: params[:hotel_id]).destroy
  end

end
