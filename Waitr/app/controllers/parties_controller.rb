class PartiesController < ApplicationController

  def show
    @party = Party.find(params[:id])
    @position = @party.queue_position
    @waiting_parties = Party.waiting_parties_count
  end

end
