class UserController < ApplicationController
	def index
		@message= current_user.messages.new
	end
end
