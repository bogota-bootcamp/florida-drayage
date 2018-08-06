class CreateZipcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zipcodes do |t|
      t.references :city, foreign_key: true
      t.float :price
      t.integer :code

      t.timestamps
    end
  end
end
