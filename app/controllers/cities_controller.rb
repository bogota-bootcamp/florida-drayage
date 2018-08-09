class CitiesController < ApplicationController
	def index
		@cities = City.all.pluck(:id,:name)
		response= {} 
		@cities.each do |element|
			response=response.merge(element[1] => nil)
		end		
		render :json => response
	end

	def zipcodes
		city= City.find_by(name: params[:name])
		zipcodes= city.zipcodes.pluck(:id,:code)
		response= {} 
		zipcodes.each do |element|
			response=response.merge(element[1] => nil)
		end		
		render :json => response
	end


end


