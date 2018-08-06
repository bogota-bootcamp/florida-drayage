class RenameColumToQuotation < ActiveRecord::Migration[5.2]
  def change
  	rename_column :quotations, :bondedargo, :bonded_cargo
  	rename_column :quotations, :type, :equipment_type 
  end
end
