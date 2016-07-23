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
  
end
