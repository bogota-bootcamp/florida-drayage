class RemoveCityToQuotation < ActiveRecord::Migration[5.2]
	def change
		remove_column :quotations ,:origin_city
		remove_column :quotations ,:destination_city
	end
end
