class ApplicationController < ActionController::Base
  # protect_from_forgery
  # skip_before_filter :verify_authenticity_token

  def index
		gon.environment = Rails.env
	end
	
	def static
	end
end
