`class PrizesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @prize = Prize.new(prize_params)
    @prize.restaurant_id = params[:restaurant_id]
    @prize.save
    redirect_to root_path
  end

  def edit
    @restaurant = Restaurant.find(session[:restaurant_id])
    @prize = Prize.find(params[:id])
  end

  def update
    @prize = Prize.find(params[:id])
    @prize.update(prize_params)
    redirect_to root_path
  end

  private
  def prize_params
    params.require(:prize).permit(:prize_name, :points_needed, :restaurant_id)
  end

end
