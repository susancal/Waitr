class RestaurantsController < ApplicationController

  def show
  	if logged_in?
  		@restaurant = Restaurant.find(session[:restaurant_id])
  		params[:id] = session[:restaurant_id]
  	else
  		redirect_to login_path
  	end
    @parties = Party.where(restaurant_id: session[:restaurant_id], in_queue: true)
    @waiting_list = @parties.order(:created_at)
  end

private
	def current_user
    @saved_user = Restaurant.find_by(id: session[:restaurant_id])
  end
	
	def logged_in?
    current_user != nil
  end

end