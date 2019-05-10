class AddServiceToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :additional_service, :string
  end
end
