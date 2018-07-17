class ConversationsController < ApplicationController
	
	before_action :delete_conversation_cookie

	def index
		user= current_user
		if (user && (user.has_role? :admin ))
			@conversations = Conversation.all
		else
			render plain: "unauthorized to see this conversation", status:401
		end
	end

	def show
		if (cookies[:conversation_id] || user_signed_in? )  
			@conversation = Conversation.find(params[:id])			
			@message=@conversation.messages.new
			@messages=@conversation.messages.all if ((user_signed_in?) and  (current_user.has_role? :admin))
			render partial: "/conversations/show", locals: {conversation: @conversation, message: @message, messages: @messages}, layout: false
		else
			render plain: "unauthorized to see this conversation", status:401
		end
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

	def delete_conversation_cookie
		#this method deleted such reques the  conversation cookie if current user is admin
		puts 'blah'*50
		cookies.delete :conversation_id if user_signed_in? && (current_user.has_role? :admin)
	end

end