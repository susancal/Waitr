module SessionHelper

  def current_user
    @saved_user = Restaurant.find_by(id: session[:restaurant_id])
  end

  def current_patron
  	@patron = Party.find_by(id: session[:party_id])
  end

  def logged_in?
    current_user != nil
  end

end