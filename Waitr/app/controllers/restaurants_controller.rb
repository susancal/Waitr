class RestaurantsController < ApplicationController

  def index

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    p params
    @parties = Party.where(restaurant_id: params[:id])
  end



end
