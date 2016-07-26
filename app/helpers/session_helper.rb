module SessionHelper

  def current_restaurant
    @saved_restaurant = Restaurant.find_by(id: session[:restaurant_id])
  end

  def current_party
  	return Party.find(session[:party_id])
  end

  def logged_in?
    current_restaurant != nil
  end



end
