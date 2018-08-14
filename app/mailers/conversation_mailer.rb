class ConversationMailer < ApplicationMailer
  def new_conversation(conversation)
    
    @conversation= conversation   
    mail(to: "fermed28@gmail.com",subject: 'New conversation',
      delivery_method_options: { api_key: ENV['Mailjet_api_key'], secret_key: ENV['Mailjet_secret_key'] })
  end
end