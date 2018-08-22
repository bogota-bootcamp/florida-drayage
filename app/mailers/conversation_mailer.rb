class ConversationMailer < ApplicationMailer
  def new_conversation(conversation)
    @conversation= conversation  
    users= User.with_role :admin        
    mail(to: users.map(&:email).uniq,subject: 'New conversation',
      delivery_method_options: { api_key: ENV['Mailjet_api_key'], secret_key: ENV['Mailjet_secret_key'] })
  end
end