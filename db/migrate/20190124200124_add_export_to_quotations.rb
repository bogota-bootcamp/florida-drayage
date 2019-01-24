class AddExportToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :export, :boolean, default: :false
    add_column :invoices, :export, :boolean, default: :false
  end
end
