class PrizesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params["restaurant_id"])
    @prize = Prize.new(prize_params)
    @prize.restaurant_id = params["restaurant_id"]
    @prize.save
    redirect_to @restaurant
  end

  def edit
    p "editing"
    @restaurant = Restaurant.find(params[:id])
    @prize = Prize.find(params[:id])
  end

  def update
    p "UPDATE PARAMS!!!!!!!!!!!!!!!!!!!!!!!!!"
    p params
  end

  private
  def prize_params
    params.require(:prize).permit(:prize_name, :points_needed, :restaurant_id)
  end

end
