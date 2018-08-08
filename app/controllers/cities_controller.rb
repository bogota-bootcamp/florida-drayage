class CitiesController < ApplicationController
	def index
		@cities = City.all.pluck(:id,:name)
		response= {} 
		@cities.each do |element|
			response=response.merge(element[1] => nil)
		end		
		render :json => response
	end


end