class AddColumsInvoice < ActiveRecord::Migration[5.2]
  def change
  	add_column :invoices,   :first_name, :string
    add_column :invoices,   :last_name, :string
    add_column :invoices,   :company, :string
    add_column :invoices,   :phone, :bigint
    add_column :invoices,   :email, :string
    add_column :invoices,   :comments, :text
  	add_column :invoices, :origin_city, :string
  	add_column :invoices, :destination_city, :string
    add_column :invoices, :origin_zipcode, :integer
    add_column :invoices, :destination_zipcode, :integer
    add_column :invoices, :commodity, :string
    add_column :invoices, :hazardous, :boolean
    add_column :invoices, :bondedargo, :boolean
    add_column :invoices, :overweight, :float
    add_column :invoices, :pickup_date, :date
    add_column :invoices, :drop_date, :date
    add_column :invoices, :type, :string
  end
end
