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
		debugger
		origin_city= City.find_by(name: params[:quotation][:origin_city])
		origin_zipcode=origin_city.zipcodes.find_by(code: params[:quotation][:origin_zipcode])
		destination_city= City.find_by(name: params[:quotation][:destination_city])
		destination_zipcode=destination_city.zipcodes.find_by(code: params[:quotation][:destination_zipcode])
		quotation= Quotation.new(quotation_parameters(origin_zipcode.id,destination_zipcode.id))
		if quotation.save
			flash[:success] = "Invoice created"			
		else
			errors= quotation.errors.full_messages
			flash[:danger] = errors			
		end
		redirect_to root_path
	end

	def delete
	end

	private
	def quotation_parameters(origin_zipcode_id,destination_zipcode_id)
		params.require(:quotation).permit(:first_name,:last_name,:title,:company,:phone,:email,:comments,:commodity,:hazardous,:bonded_cargo,:overweight,:pickup_date,:drop_date,:equipment_type).merge(origin_zipcode:origin_zipcode_id, destination_zipcode:destination_zipcode_id)
	end
end



