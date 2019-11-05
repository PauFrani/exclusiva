class CreateBrandRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_ranks do |t|
      t.string :order
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
