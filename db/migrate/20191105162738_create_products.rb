class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :min_price
      t.float :max_price
      t.string :category
      t.string :description
      t.string :sku_ext
      t.boolean :published
      t.references :showroom, foreign_key: true

      t.timestamps
    end
  end
end
