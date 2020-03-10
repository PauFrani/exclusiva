class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :qr
      t.string :payment_method
      t.references :showroom_variant_stock, foreign_key: true
      t.references :bidding, foreign_key: true

      t.timestamps
    end
  end
end
