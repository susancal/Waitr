module AuthorizationHelper

	def authorized?(prize_maker)
    # pass in prize.restaurant to check if they're authorized.
    logged_in? && prize_maker.id == current_user.id
  end

end