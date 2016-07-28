class ApplicationController < ActionController::Base
	include SessionHelper
	include AuthorizationHelper
  include GuessesHelper

  protect_from_forgery with: :null_session,
      if: Proc.new { |c| c.request.format =~ %r{application/json} }

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
