class RestaurantController < ApplicationController

  def index
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @parties = Party.where(restaurant_id: params[:restaurant_id])
  end



end
