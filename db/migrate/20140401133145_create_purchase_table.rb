class CreatePurchaseTable < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchaser_name
      t.string :item_description
      t.decimal :item_price
      t.integer :items_count
      t.string :merchant_address
      t.string :merchant_names

    
      t.timestamps
    end
  end
end
