class QuotationsController < ApplicationController

	def index
		@quotations= Quotation.all
	end

	def new
	end

	def show
		@quotation = Quotation.find(params[:id])
		@invoice = Invoice.new
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
		params.require(:quotation).permit(:first_name,:last_name,:title,:company,:email,:comments)
	end
end
