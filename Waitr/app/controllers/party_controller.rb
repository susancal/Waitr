class PartyController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @parties = Party.find_by(in_queue?)
  end
end
