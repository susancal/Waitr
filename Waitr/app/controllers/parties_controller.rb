class PartiesController < ApplicationController

  def edit
    party = Party.find(params[:id])
    p party.name
    p party.in_queue
    p params
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])

  end
end