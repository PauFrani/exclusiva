class ShowroomVariantStocksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bidding = Bidding.find(session[:bidding_id])
    @products_items = ShowroomVariantStock.joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0)
    @markers = @products_items.map do |product_item|
      if product_item.showroom.address.latitude != nil
        {
          lat: product_item.showroom.address.latitude,
          lng: product_item.showroom.address.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { product_item: product_item }),
          image_url: helpers.asset_url('https://i.ibb.co/MVHrLcB/perchero2.png')
          # image_url: helpers.asset_url('https://i.ibb.co/zfL4Rt9/perchero3.png')
        }
      end
    end
  end

  def show
    @showroom_variant_stock = ShowroomVariantStock.find(params[:id])
  end
end
