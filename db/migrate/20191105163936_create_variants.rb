class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :stock
      t.string :color
      t.string :size
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
