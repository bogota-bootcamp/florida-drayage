class InvoicesController < ApplicationController
	def create    
    quotation= Quotation.find(params[:quotation_id])    
    invoice=quotation.invoices.new(invoice_parameters)
    if invoice.save    
      mail=InvoiceMailer.new_invoice(quotation,invoice)
      response = mail.deliver_now
      flash[:success] = "Invoice created"
    else
      @errors= invoice.errors.full_messages
      flash[:danger] = @error
    end
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
    flash[:success] = "payment accepted"

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to back
      
    redirect_to  quotation_invoice_path(quotation,invoice)
  end

  private

  def invoice_parameters
    params.require(:invoice).permit(:price)
  end
end




  