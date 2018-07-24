class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company
      t.integer :phone
      t.string :email
      t.text :comments

      t.timestamps
    end
  end
end
