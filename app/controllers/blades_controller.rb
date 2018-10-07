class BladesController < ApplicationController

  def index
    @blades = Blade.all
    render json: @blade
  end

  def show
    @blade = Blade.find(params[:id])
    render json: @blade
  end

  def create
    @blade = Blade.find(params[:blade_id])
  end


end
