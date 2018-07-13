class ApplicationController < ActionController::Base
	before_action :set_cookie_user


	def set_cookie_user	
		cookies[:user_id]= nil
		cookies[:user_id] = current_user.id	 if user_signed_in?
	end
end
