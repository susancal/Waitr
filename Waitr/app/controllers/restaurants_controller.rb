class RestaurantsController < ApplicationController

  def show
  	if logged_in?
      # replace with current_restaurant helper method
  		current_restaurant
  		params[:id] = session[:restaurant_id]
      @waiting_list = @restaurant.waiting_list
      @prize = @restaurant.prize
      @parties = Party.where(restaurant_id: session[:restaurant_id], in_queue: true)
      @waiting_list = @parties.order(:created_at)
      @new = @waiting_list.map { |e| e.elapsed }
    else
      redirect_to login_path
    end

    if request.xhr?
      render json: @new.to_json
    end
  end

  def waitingroom
    @party = Party.find(session[:party_id])
    p @party
    p params
    if @party.waitingroom != nil
      render :waiting
    else
      @wr = Waitingroom.find_or_create_by(restaurant_id: params[:restaurant_id], party_id: @party.id, party_key: @party.key)
      render :waiting
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



