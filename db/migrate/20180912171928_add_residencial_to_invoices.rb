class AddResidencialToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :residencial, :boolean, :default => false
  end
end
