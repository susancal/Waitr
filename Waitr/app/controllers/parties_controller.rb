class PartiesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party = Party.new

  end

  def edit
    party = Party.find(params[:id])
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])

  end

  def create 
  
    @party = Party.new(party_params)
    p params[:restaurant_id]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party.restaurant_id = params[:restaurant_id]
    @party.in_queue = true
    if @party.save
      p "Saved"
    else
      p "Not saved"
    end

    redirect_to restaurant_path(@restaurant)
  end

  private
    def party_params
      params.require(:party).permit(:name, :size, :cell)
    end
end