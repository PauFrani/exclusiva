class ShowroomVariantStocksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bidding = Bidding.find(session[:bidding_id])
    @products_items = ShowroomVariantStock.joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0)
    @geocodes = @products_items.map do |product| product.showroom.address end
    @markers = @geocodes.map do |product|
      if product.latitude != nil
      {
        lat: product.latitude,
        lng: product.longitude
      }
      end
    end
  end

  def show
    @showroom_variant_stock = ShowroomVariantStock.find(params[:id])
  end
end
