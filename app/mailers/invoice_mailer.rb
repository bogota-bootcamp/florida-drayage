class InvoiceMailer < ApplicationMailer
	def new_invoice(quotation,invoice)
  	
  	@quotation= quotation  
  	@invoice= invoice
  	mail(to:  "#{@quotation.email}",subject: "Invoice #{@invoice.id}",
  		delivery_method_options: { api_key: ENV['Mailjet_api_key'], secret_key: ENV['Mailjet_secret_key'] })
  end
end
