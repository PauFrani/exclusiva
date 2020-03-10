class ProductItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bidding = Bidding.find(session[:bidding_id])
    @products_items = ProductItem.joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("product_items.stock > ?", 0)
    @markers = @products_items.map do |product_item|
      if product_item.showroom.address.latitude != nil
        {
          lat: product_item.showroom.address.latitude,
          lng: product_item.showroom.address.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { product_item: product_item }),
          image_url: 'https://i.ibb.co/MVHrLcB/perchero2.png'
          # image_url: helpers.asset_url('https://i.ibb.co/zfL4Rt9/perchero3.png')
        }
      end
    end
  end

  def show
    @product_item = ProductItem.find(params[:id])
  end
end

  # def index
  #   @bidding = Bidding.find(session[:bidding_id])
  #   @products_items = ProductItem.joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("product_items.stock > ?", 0)
  #   @product_addresses = @products_items.map { |product_item| product_item.showroom.address }
  #   @markers = @product_addresses.map do |address|
  #     if address.latitude.nil?
  #       {
  #         lat: address.latitude,
  #         lng: address.longitude,
  #         infoWindow: render_to_string(partial: "info_window", locals: { product_item:  })
  #       }
  #     end
  #   end
  # end
