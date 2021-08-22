class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :item_prefecture_id
      t.string :city
      t.string :addresses
      t.string :building
      t.string :phone_number
      t.references :order
      t.timestamps
    end
  end
end
