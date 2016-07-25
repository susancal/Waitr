class LeaderboardController < ApplicationController

  def index
    @current_party = Party.find(session[:party_id])
    @rest = Restaurant.find(params[:id])
    @current = @rest.waiting_list.sort {|x,y| y[:points_earned]<=>x[:points_earned]}
  end

end
