class SessionsController < ApplicationController

	def new
	end

	def create
		@restaurant = Restaurant.find_by(name: login_params[:name])
		if @restaurant && @restaurant.authenticate(login_params[:password])
			session[:restaurant_id] = @restaurant.id

			redirect_to root_path
		else
			@error = "Your name or password was incorrect."
			render 'new'
		end
	end

	def destroy
		session.delete(:restaurant_id)
    redirect_to root_path
	end

	def login_params
		params.require(:restaurant).permit(:name, :password)
	end

end