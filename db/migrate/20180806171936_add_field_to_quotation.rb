class AddFieldToQuotation < ActiveRecord::Migration[5.2]
  def change
  	add_column :quotations, :origin_city, :integer
    add_column :quotations, :origin_zipcode, :integer

    add_column :quotations, :destination_city, :integer
    add_column :quotations, :destination_zipcode, :integer

    add_column :quotations, :commodity, :string
    add_column :quotations, :hazardous, :boolean
    add_column :quotations, :bondedargo, :boolean
    add_column :quotations, :overweight, :float
  end
end
