class AddDefaultValueFieldsToQuotation < ActiveRecord::Migration[5.2]
	def change
		change_column_default  :quotations,  :bonded_cargo,  false
		change_column_default  :quotations,  :hazardous,  false
	end
end
