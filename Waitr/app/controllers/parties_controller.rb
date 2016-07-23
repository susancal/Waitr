class PartiesController < ApplicationController

  def show
    @party = Party.find(params[:id])
    @restaurant = @party.restaurant
    p @restaurant
    p @party
    @waiting_parties = @restaurant.waiting_list
    # @waiting_parties = Party.waiting_parties_count
    # p @waiting_parties
  end

  def edit
    party = Party.find(params[:id])
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def create
    party = Party.new(party_params)
    party.restaurant_id = params[:restaurant_id]
    if party.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      redirect_to new_restaurant_party_path
    end
  end

  private
  def party_params
    params.require(:party).permit(:name, :cell, :size, :restaurant_id)
  end

end
