class CreateShowroomVariantStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :showroom_variant_stocks do |t|
      t.integer :stock
      t.references :showroom, foreign_key: true
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
