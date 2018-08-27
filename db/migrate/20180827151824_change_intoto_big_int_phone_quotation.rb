class ChangeIntotoBigIntPhoneQuotation < ActiveRecord::Migration[5.2]
  def change
  	change_column :quotations, :phone, :bigint
  end
end
