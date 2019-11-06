class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :qr
      t.string :payment_method
      t.references :product_item, foreign_key: true
      t.references :bidding, foreign_key: true

      t.timestamps
    end
  end
end
