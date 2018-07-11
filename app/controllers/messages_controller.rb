class MessagesController < ApplicationController

	def create
		puts '*'*50
		puts params
		@message = Message.create(message_params)
		response = render :partial => "messages/message"
		#creates 
	  if current_user.has_role? :admin and params[:client]
			ActionCable.server.broadcast "user_#{params[:client][:user_id]}", {action: "created", msg: response	 }
		else	
			ActionCable.server.broadcast "user_#{current_user.id}", {action: "created", msg: response	 }
		end
		ActionCable.server.broadcast "user_admin", {action: "created", msg: response	 }
	end

	private
	def message_params
		params.require(:message).permit(:body).merge(user_id: current_user.id)
	end
end
