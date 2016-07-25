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

    @new = @waiting_list.map { |e| e.elapsed }
    if request.xhr?
      render json: @new.to_json
    end
  end

  def waitingroom
    @party = Party.find(session[:party_id])
    @wr = Waitingroom.create(restaurant_id: params[:id], party_id: @party.id, party_key: @party.key)
    render :waiting
  end

private
	def current_user
    @saved_user = Restaurant.find_by(id: session[:restaurant_id])
  end

	def logged_in?
    current_user != nil
  end

end
