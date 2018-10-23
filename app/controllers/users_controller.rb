class UsersController < ApplicationController

  def index
    @users = User.all
    render json:@users
  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: { error: 'Invalid username and password combination.' }, status: 400
    end
  end

  def validate
    user = currrent_user
    if user
      render json: {email: user.email, token: token}
    else
      render json: {error: 'Validation failed.'}, status: 400
    end
  end

  def get_wishlist
    user = User.find(params[:user_id])
    render json: user.wishlisted_hotels
  end


  def signup
    @user = User.new(email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      render json: @user, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end


  def wishListed
    @user = User.find(params[:id])
    render json: @user
  end


  def add_hotel
    @user = User.find_by(email: params[:user_email])
    @hotel= Hotel.find(params[:hotel_id])
    @wishlist = @user.wishlist[params[:wishlist].to_i]
    @added_hotel = Like.create(hotel: @hotel, wishlist: @wishlist)
    @wishlist = Wishlist.where(user: @user)
    render json: @wishlist
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
