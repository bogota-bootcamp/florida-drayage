class MessagesController < ApplicationController

	def create
		@message = Message.create(message_params)
		response = render :partial => "messages/message"
		ActionCable.server.broadcast "user_#{current_user.id}", {action: "created", msg: response	 }
		
	end

	private
	def message_params

		params.require(:message).permit(:body).merge(user_id: current_user.id)
	end
end
