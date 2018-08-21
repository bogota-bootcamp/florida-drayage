class QuotationsController < ApplicationController

	def index

		user= current_user
		if (user && (user.has_role? :admin ))		
			@quotations= Quotation.all
		else
			render plain: "unauthorized to see this page", status:401
		end
	end

	def new
	end

	def show
		user= current_user		
		@quotation = Quotation.find(params[:id])
		@invoices = @quotation.invoices		
		@invoice = @quotation.invoices.new
		unless (user && (user.has_role? :admin ))	
			render "quotations/_quotation_header", layout:true
		end
	end

	def create
		@quotation= Quotation.new(quotation_parameters)
		if @quotation.save
			mail=QuotationMailer.new_quotation(@quotation)
      response = mail.deliver_now
			flash[:success] = "Invoice created"			
		else
			errors= @quotation.errors.full_messages
			flash[:danger] = errors			
		end
		redirect_to root_path
	end

	def delete
	end

	private
	def quotation_parameters
		params.require(:quotation).permit(:first_name,:last_name,:title,:company,:phone,:email,:comments,:commodity,:hazardous,:bonded_cargo,:overweight,:pickup_date,:drop_date,:equipment_type,:origin_zipcode,:destination_zipcode,:origin_city,:destination_city)
	end
end



