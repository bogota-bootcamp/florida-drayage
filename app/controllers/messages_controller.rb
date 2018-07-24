class MessagesController < ApplicationController

	def create
		conversation = Conversation.find(params[:conversation_id])
		@message = conversation.messages.new(message_params)
		if user_signed_in?
			@message.sender= "admin"
		else
			@message.sender= "client"
		end
		@message.save
		response = render :partial => "messages/message",:locals=>{message: @message}
		#creates 
	  ActionCable.server.broadcast "user_conversation_#{conversation.id}", {action: "new-message", msg: response, conversation_id:conversation.id	 }
		ActionCable.server.broadcast "user_admin", {action: "new-message", msg: response, conversation_id:conversation.id	 }
	end

	private
	def message_params
		params.require(:message).permit(:body)
	end
end
