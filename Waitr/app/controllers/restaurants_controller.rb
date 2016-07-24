class RestaurantsController < ApplicationController

  def show
  	if logged_in?
      # replace with current_restaurant helper method
  		current_restaurant
  		params[:id] = session[:restaurant_id]
      @waiting_list = @restaurant.waiting_list
      @prize = @restaurant.prize
    else
      redirect_to login_path
    end
  end

private
	def current_restaurant
    @restaurant = Restaurant.find_by(id: session[:restaurant_id])
  end

	def logged_in?
    current_restaurant != nil
  end

end
