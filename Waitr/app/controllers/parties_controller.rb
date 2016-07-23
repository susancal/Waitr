class PartiesController < ApplicationController

  def show
    @party = Party.find(params[:id])
    @waiting_parties = Party.waiting_parties_count
  end

  def edit
    party = Party.find(params[:id])
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def create
    p params
    party = Party.new(party_params)
    party.restaurant_id = params[:restaurant_id]
    p party.save
    p "did it save"
    p party
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private
  def party_params
    params.require(:party).permit(:name, :cell, :size, :restaurant_id)
  end

end
