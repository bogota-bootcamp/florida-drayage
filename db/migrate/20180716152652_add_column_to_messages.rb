class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
  	add_column :messages, :read, :boolean
  	add_column :messages, :sender, :string
  end
end
