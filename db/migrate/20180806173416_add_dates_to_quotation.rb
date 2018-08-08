class AddDatesToQuotation < ActiveRecord::Migration[5.2]
  def change
  	add_column :quotations, :pickup_date, :date
  	add_column :quotations, :drop_date, :date
  	add_column :quotations, :type, :string
  end
end
