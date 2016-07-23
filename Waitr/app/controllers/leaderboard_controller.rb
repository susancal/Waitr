class LeaderboardController < ApplicationController

  def index
    @rest = Restaurant.find(params[:id])
    @current = @rest.waiting_list.sort {|x,y| y[:points_earned]<=>x[:points_earned]}
  end

end
