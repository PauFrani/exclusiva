class ProductItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bidding = Bidding.find(session[:bidding_id])
    @product_items = ProductItem.joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("product_items.stock > ?", 0)

  end

  def show
    @product_item = ProductItem.find(params[:id])
    @variants = @product_item.product.variants
    @purchase = Purchase.new

  end
end
