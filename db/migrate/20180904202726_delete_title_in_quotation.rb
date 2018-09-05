class DeleteTitleInQuotation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :quotations, :title
  end
end
