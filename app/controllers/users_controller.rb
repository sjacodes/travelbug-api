class UsersController < ApplicationController

  def index
    @users = User.all
    render json:@users
  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: {email: user.email, id: user.id, wishlisted_hotels: user.findUsersWishListedHotels}
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


  def signup
    @user = User.new(email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      render json: {email: @user.email, id: @user.id}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
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

  def get_wishlist
    @user = User.find(params[:id])
    @wishlist = Wishlist.where(user: @user)
    render json: wishlist
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
