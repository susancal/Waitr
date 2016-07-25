class RestaurantsController < ApplicationController

  def index
  	if logged_in?
      @restaurant = Restaurant.find(session[:restaurant_id])
      @waiting_list = @restaurant.waiting_list
      @prize = @restaurant.prize
      @parties = Party.where(restaurant_id: session[:restaurant_id], in_queue: true)
      @waiting_list = @parties.order(:created_at)
      @new = @waiting_list.map { |e| e.elapsed }
      # else
      #   redirect_to "/restaurants/#{session[:restaurant_id]}"
    else
      redirect_to login_path
    end

    if request.xhr?
      render json: @new.to_json
    end
  end

  def waitingroom
    if Waitingroom.all.length == 0
      random = match_key
      Key.create(key: random, quiz_id: rand(1..30))
    elsif Waitingroom.all.length == 1
        random = Waitingroom.first.key
    end
    @party = Party.find(session[:party_id])
    if @party.waitingroom != nil
      render :waiting
    else
      @wr = Waitingroom.find_or_create_by(restaurant_id: params[:restaurant_id], party_id: @party.id, party_key: @party.key, key: random)
      render :waiting
    end
  end

private
  def correct_page
    params[:id] == session[:restaurant_id]
  end

	def current_restaurant
    @restaurant = Restaurant.find_by(id: session[:restaurant_id])
  end

  def match_key
    return [*"0".."9"].sample(6).join
  end

	def logged_in?
    session[:restaurant_id] != nil
  end

end



