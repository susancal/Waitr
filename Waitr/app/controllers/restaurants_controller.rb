class RestaurantsController < ApplicationController

  def index

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @parties = Party.where(restaurant_id: params[:id], in_queue: true)
    @waiting_list = @parties.order(:created_at)
  end



end
