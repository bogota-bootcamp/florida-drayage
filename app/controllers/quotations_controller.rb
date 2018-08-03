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
		@quotation = Quotation.find(params[:id])
		@invoices = @quotation.invoices		
		@invoice = @quotation.invoices.new
	end

	def create
		quotation= Quotation.new(quotation_parameters)
		if quotation.save
			redirect_to root_path
		end
	end

	def delete
	end

	private
	def quotation_parameters
		params.require(:quotation).permit(:first_name,:last_name,:title,:company,:email,:comments,:phone)
	end
end
