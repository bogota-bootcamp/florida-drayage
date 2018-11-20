class ConversationsController < ApplicationController
  
  before_action :delete_conversation_cookie

  def index
    user= current_user
    if (user && (user.has_role? :admin ))
      @conversations = Conversation.order('id DESC')
    else
      render plain: "unauthorized to see this conversation", status:401
    end
  end

  def show
    if (cookies[:conversation_id] || user_signed_in? )  
      @conversation = Conversation.find(params[:id])      
      @message=@conversation.messages.new
      if ((user_signed_in?) and  (current_user.has_role? :admin))
        @messages=@conversation.messages.all
        respond_to do |format|
          format.js { render :file => "/conversations/show_admin.js.erb" }
        end
        #render partial: "/conversations/show_admin", locals: {conversation: @conversation, message: @message, messages: @messages}, layout: false
      end 
    else
      render plain: "unauthorized to see this conversation", status:401
    end
  end

  def new 
    conversation = Conversation.find_by_id(cookies[:conversation_id])
    unless (cookies[:conversation_id] && conversation)
      @conversation = Conversation.new
      #render partial: "/conversations/new", locals: {conversation: @conversation}, layout:false
    else
      redirect_to conversation_path(conversation) 
    end
  end

  def create
    @conversation = Conversation.new(conversation_parameters)
    if @conversation.save
      cookies[:conversation_id] =@conversation.id
      #response = render :partial => "conversations/client_cart",:locals=>{conversation: @conversation} 
      ActionCable.server.broadcast "user_admin", {action: "new-conversation", conversation: @conversation }
      mail=ConversationMailer.new_conversation(@conversation)
      response = mail.deliver_now
      flash[:success] = "Conversation created"  
    else
      @errors= @conversation.errors.full_messages
      flash[:danger] = @error   
    end
    redirect_to root_path
  end

  def destroy
    conversation= Conversation.find(params[:id])
    conversation.destroy
    flash[:info] = "Conversation Deleted"
    redirect_to conversations_path
    #state active conversation an desactivate when user end conversation,admin only 
    #can delete conversation if the state is desactive
  end

  private

  def conversation_parameters
    params.require(:conversation).permit(:name,:mail)
  end

  def delete_conversation_cookie
    #this method deleted such reques the  conversation cookie if current user is admin    
    cookies.delete :conversation_id if user_signed_in? && (current_user.has_role? :admin)
  end

end