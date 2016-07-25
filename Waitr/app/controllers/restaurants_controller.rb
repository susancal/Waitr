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
    @prize = @restaurant.prize
    @new = @waiting_list.map { |e| e.elapsed }
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
	def current_user
    @saved_user = Restaurant.find_by(id: session[:restaurant_id])
  end

	def logged_in?
    current_user != nil
  end

end



