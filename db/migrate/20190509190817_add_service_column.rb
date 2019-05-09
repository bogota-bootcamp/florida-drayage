class AddServiceColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :additional_service, :string
  end
end
