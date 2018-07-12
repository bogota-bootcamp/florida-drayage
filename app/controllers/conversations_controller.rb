class ConversationsController < ApplicationController
	
	
	def show
		@conversation = Conversation.find(params[:id])
		@message=@conversation.messages.new
	end

	def new 
		@conversation = Conversation.new
	end

	def create
		@conversation = Conversation.new(conversation_parameters)
		if @conversation.save
			redirect_to @conversation
			cookies[:conversation_id] =@conversation.id
		else
			puts '*'*50
			puts 'error creando conversacion'
		end
	end

	def destroy
	end

	private

	def conversation_parameters
		params.require(:conversation).permit(:name,:mail)
	end

end