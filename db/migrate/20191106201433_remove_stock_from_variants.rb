class RemoveStockFromVariants < ActiveRecord::Migration[5.2]
  def change
      remove_column :variants, :stock
  end
end
