class PartiesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party = Party.new
  end

  def show
      if Party.find_by(key: params[:id]) != nil
        @party = Party.find_by(key: params[:id])
        session[:party_id] = @party.id
        @restaurant = @party.restaurant
        @waiting_parties = @restaurant.waiting_list
        parties = @restaurant.waiting_list.map { |e| e.id  }
        @people_ahead = parties.index(@party.id)
        @prize = @restaurant.prize
      else
        redirect_to root_path
      end

  end

  def edit
    party = Party.find(params[:id])

    if party.did_they_win?
      party.send_prize_email
    end

    party.in_queue = false
    party.save
    redirect_to root_path
  end

  def create
    # p request.protocol + request.host
    # p request.base_url

    party = Party.new(party_params)
    party.restaurant_id = params[:restaurant_id]

    if party.save
      # session[:party_id] = party.id
      # session[:party_key] = party.key

      account_sid = ENV['TWILIO_SID']
      auth_token = ENV['TWILIO_TOKEN']

      link = request.base_url + "/restaurants/" + params[:restaurant_id] + "/parties/" + party.key

      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.messages.create(
        from: '+12242796373',
        to: '+17082548335',
        body: "Thanks for waiting.  Click here to check your wait time and play a game. #{link}"
      )
      redirect_to root_path
    else
      redirect_to new_restaurant_party_path
    end
  end

  private
    def party_params
      params.require(:party).permit(:name, :cell, :size, :restaurant_id)
    end
end

