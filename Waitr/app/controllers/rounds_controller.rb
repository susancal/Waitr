class RoundsController < ApplicationController


  def index

  end

  def new

  end

  def create
    @player1 = Party.find(params[:player_one_id])
    @round = Round.create(party_one_id: params[:player_one_id])
    p @round
    render :waiting
  end



  def summary
  end


end
