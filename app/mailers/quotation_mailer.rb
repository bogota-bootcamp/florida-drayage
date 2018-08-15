class QuotationMailer < ApplicationMailer
   def new_quotation(quotation)
    
    @quotation= quotation   
    mail(to: "#{@quotation.email}",subject: 'New Quotation',
      delivery_method_options: { api_key: ENV['Mailjet_api_key'], secret_key: ENV['Mailjet_secret_key'] })
  end
end
