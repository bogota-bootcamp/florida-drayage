class AddResidencialToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :residencial, :boolean, :default => false
  end
end
