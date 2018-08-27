class InvoicesController < ApplicationController
	def create    
    @quotation= Quotation.find(params[:quotation_id])    
    @invoice=@quotation.invoices.new(invoice_parameters)
    if @invoice.save    
      #mail=InvoiceMailer.new_invoice(@quotation,@invoice)
      #response = mail.deliver_now
      flash[:success] = "Invoice created"
    else
      @errors= invoice.errors.full_messages
      flash[:danger] = @error
    end

    respond_to do |format|
      format.html { redirect_to quotations_path }
      format.js      
    end
    
  end

  def show
    @quotation = Quotation.find(params[:quotation_id]) if params[:quotation_id]
    @invoice= Invoice.find(params[:id])
  end

  def payment

    invoice= Invoice.find(params[:id])
    quotation= Quotation.find(params[:quotation_id])
    #debugger

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
      
    redirect_to  quotation_invoice_path(quotation,invoice)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to back
  end

  def upload
    @invoice= Invoice.find(params[:id])
    @invoice.uploads.attach(params[:invoice][:uploads])
    @quotation= @invoice.quotation
  end

  private

  def invoice_parameters
    params.require(:invoice).permit(:price, uploads:[])
  end
end




  