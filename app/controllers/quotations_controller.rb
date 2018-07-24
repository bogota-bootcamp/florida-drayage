class QuotationsController < ApplicationController

	def index
	end

	def new
	end

	def show
	end

	def create
	end

	def delete
	end

	private
	def quotation_parameters
		params.require(:quotation).permit()
	end
end
