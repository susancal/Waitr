class PartiesController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party = Party.new

  end

  def edit
    party = Party.find(params[:id])
    party.in_queue = false
    party.save
    redirect_to restaurant_path(params[:restaurant_id])

  end

  def create 
  
    @party = Party.new(party_params)
    p params[:restaurant_id]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @party.restaurant_id = params[:restaurant_id]
    @party.in_queue = true
    if @party.save
      account_sid = 'AC30eba678ab51326f08e0af6ec82ddc8f'
      auth_token = '7cd9dd7f964c9929ecd5e6b16052200f'

      @client = Twilio::REST::Client.new account_sid, auth_token


      @client.messages.create(
        from: '+12242796373',
        to: '+18155457182',
        body: 'I have hard coded the numbers but it is working after the create!'
      )
      @client.messages.create(
        from: '+12242796373',
        to: '+18479620328',
        body: 'I have hard coded the numbers but it is working after the create!'
      )

    else
      p "Not saved"
    end

    redirect_to restaurant_path(@restaurant)
  end

  private
    def party_params
      params.require(:party).permit(:name, :size, :cell)
    end
end