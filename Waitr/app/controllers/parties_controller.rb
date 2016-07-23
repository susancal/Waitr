class PartiesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party = Party.new
  end

  def show
    @party = Party.find(params[:id])
    @restaurant = @party.restaurant
    p @restaurant
    p @party
    @waiting_parties = @restaurant.waiting_list
    # @waiting_parties = Party.waiting_parties_count
    # p @waiting_parties
  end

  def edit
    party = Party.find(params[:id])
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def create 
  
    party = Party.new(party_params)
    party.restaurant_id = params[:restaurant_id]
    if party.save
      account_sid = 'AC30eba678ab51326f08e0af6ec82ddc8f'
      auth_token = '7cd9dd7f964c9929ecd5e6b16052200f'

      @client = Twilio::REST::Client.new account_sid, auth_token


      @client.messages.create(
        from: '+12242796373',
        to: '+17082548335',
        body: 'I have hard coded the numbers but it is working after the create! http://lifehacker.com'
      )

      redirect_to restaurant_path(params[:restaurant_id])
    else
      redirect_to new_restaurant_party_path
    end

  end


  private
    def party_params
      params.require(:party).permit(:name, :cell, :size, :restaurant_id)
    end

end
  