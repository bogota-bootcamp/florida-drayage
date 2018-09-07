class ChangeIntotoBigIntPhoneInvoice < ActiveRecord::Migration[5.2]
  def change
  	change_column :invoices, :phone, :bigint
  end
end
