namespace :import do

	require 'csv'

	desc "create cuty record and price-zipcode with the data in file.csv"
	task uploaddata: :environment do
		Dir.glob('lib/files/data.csv').each do |archivo|			
			CSV.foreach(archivo, headers:true) do |row|
				
			end
		end
	end
end
