class InvoicesController < ApplicationController
	def create    
    quotation= Quotation.find(params[:quotation_id])    
    invoice=quotation.invoices.new(invoice_parameters)
    invoice.save    
    mail=InvoiceMailer.new_invoice(quotation,invoice)
    response = mail.deliver_now
    redirect_to quotation
  end

  def show
    @quotation = Quotation.find(params[:quotation_id]) if params[:quotation_id]
    @invoice= Invoice.find(params[:id])
  end

  def payment

    invoice= Invoice.find(params[:id])
    quotation= Quotation.find(params[:quotation_id])


    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => invoice.price*100,
      :description => "#{quotation.id}-#{invoice.id}",
      :currency    => 'usd'
    )
    
    invoice.update(paid_out: true)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to back
  end

  private

  def invoice_parameters
    params.require(:invoice).permit(:price)
  end
end




  