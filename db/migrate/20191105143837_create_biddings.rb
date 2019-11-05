class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.integer :amount
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
