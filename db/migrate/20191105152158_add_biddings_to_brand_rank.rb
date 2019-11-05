class AddBiddingsToBrandRank < ActiveRecord::Migration[5.2]
  def change
    add_reference :brand_ranks, :bidding, foreign_key: true
  end
end
