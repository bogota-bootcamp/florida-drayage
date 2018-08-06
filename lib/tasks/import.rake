namespace :import do

	require 'csv'

	desc "create cuty record and price-zipcode with the data in file.csv"
	task uploaddata: :environment do
		Dir.glob('lib/files/data.csv').each do |archivo|			
			CSV.foreach(archivo, headers:true) do |row|
				name=row["City"]
				code= row["ZIP code"]
				price= row["Price"]
				p row
				city = City.find_or_create_by(name: name)
				unless city.zipcodes.find_by(code: code)
					city.zipcodes.create(code: code,price: price)
				end
			end
		end
	end
end
