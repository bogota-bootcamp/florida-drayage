class FixBondedCargoNameInvoice < ActiveRecord::Migration[5.2]
  def change
  	rename_column :invoices, :bondedargo, :bonded_cargo
  	rename_column :invoices, :type, :equipment_type
  end
end
