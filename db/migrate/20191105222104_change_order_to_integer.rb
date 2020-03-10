class ChangeOrderToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :brand_ranks, :order, :string
    add_column :brand_ranks, :order, :integer
  end
end
