class QuotationMailer < ApplicationMailer
   def new_quotation(quotation)
    users= User.with_role :admin

    @quotation= quotation
    mail(to: "#{@quotation.email}",subject: 'Your Quote with Drayage Florida is under review!',cc: users.map(&:email).uniq,
      delivery_method_options: { api_key: ENV['Mailjet_api_key'], secret_key: ENV['Mailjet_secret_key'] })
  end
end
