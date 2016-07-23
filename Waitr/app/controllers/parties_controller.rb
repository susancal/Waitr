class PartiesController < ApplicationController

  def show
    @party = Party.find(params[:id])    
    @waiting_parties = Party.waiting_parties_count
  end

end
