class AddCityFieldToQuotation < ActiveRecord::Migration[5.2]
	def change
		add_column :quotations, :origin_city, :string
		add_column :quotations, :destination_city, :string
	end
end
