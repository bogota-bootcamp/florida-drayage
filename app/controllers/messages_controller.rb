class MessagesController < ApplicationController

	def create
		conversation = Conversation.find(params[:conversation_id])
		@message = conversation.messages.create(message_params)
		response = render :partial => "messages/message"
		#creates 
	  ActionCable.server.broadcast "user_conversation_#{conversation.id}", {action: "created", msg: response	 }
		ActionCable.server.broadcast "user_admin", {action: "created", msg: response	 }
	end

	private
	def message_params
		params.require(:message).permit(:body)
	end
end
