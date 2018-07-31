class AddPriceInvoice < ActiveRecord::Migration[5.2]
  def change
  	add_column :invoices, :price, :integer
  	add_column :invoices, :paid_out, :boolean
  end
end
