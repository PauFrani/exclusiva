class ShowroomVariantStocksController < ApplicationController
  #skip_before_action :authenticate_user!

  def index
    #bidding actual
    @bidding = Bidding.find(session[:bidding_id])
    #biddings anteriores
    @biddings = Bidding.where(user_id: current_user.id)
    if search_validation?(@bidding, @biddings)
      @showroom_variant_stocks = ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0)
      @markers = @showroom_variant_stocks.map do |showroom_variant_stock|
        if showroom_variant_stock.showroom.address.latitude != nil
          {
            lat: showroom_variant_stock.showroom.address.latitude,
            lng: showroom_variant_stock.showroom.address.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { showroom_variant_stock: showroom_variant_stock }),
            image_url: 'https://i.ibb.co/MVHrLcB/perchero2.png'
            # image_url: helpers.asset_url('https://i.ibb.co/zfL4Rt9/perchero3.png')
          }
        end
      end
    end
  end

  def search_validation?(bidding, biddings)
    biddings.each do |bid|
      if bid.id != bidding.id
        if bid.category == bidding.category && bidding.amount < bid.amount

          redirect_to unique_showroom_variant_stocks_path
        else
          return true
        end
      end
    end
  end


  def show
    @showroom_variant_stock = ShowroomVariantStock.find(params[:id])
    @variants = @showroom_variant_stock.variant.product
    @purchase = Purchase.new
    @bidding = Bidding.find(session[:bidding_id])
    flash[:timer] = @bidding.created_at
  end
end


# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0).joins(:bidding).where(brand_ranks: { bidding_id: @bidding.id }).order(order: :desc)
# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0).joins(showroom: {brand: :brand_ranks}).reorder(order: :asc)
# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0)
