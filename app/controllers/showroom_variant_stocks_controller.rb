class ShowroomVariantStocksController < ApplicationController

  def index
    #bidding actual
    @bidding = Bidding.find(session[:bidding_id])
    #biddings anteriores
    @biddings = current_user.biddings.includes(:purchase).where(purchases: {id: nil}).where.not(id: @bidding.id).where("biddings.updated_at < ?", @bidding.created_at - 10.days)
    @bid = search_validation?(@bidding, @biddings)
    if @bid
      flash[:notice] = "Usted ya realizó una busqueda por #{@bid.amount} ARS anteriormente. ¡Nuestras ofertas son únicas!"
      redirect_to root_path
    else
      @showroom_variant_stocks = ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").
                                joins(:address).
                                joins(:product).
                                where(products: { category: @bidding.category }).
                                where("products.min_price < ?", @bidding.amount).
                                where("products.max_price > ?", @bidding.amount).
                                where("showroom_variant_stocks.stock > ?", 0).
                                all.uniq { |svs| "#{svs.showroom_id}-#{svs.variant.product_id}" }
      @brand_ranks = @bidding.brand_ranks.sort_by{|br| br.order}.map{|br| br.brand_id}
      @showroom_variant_stocks.sort_by!{|svs| @brand_ranks.index(svs.showroom.brand.id)}
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
    biddings.where(category: bidding.category).where("amount >= ?", bidding.amount).last
  end

  def show
    @bidding = Bidding.find(session[:bidding_id])
    @showroom_variant_stock = ShowroomVariantStock.find(params[:id])
    @showroom_variant_stocks = ShowroomVariantStock.joins(:variant).joins(:product).where("products.id = ?", @showroom_variant_stock.variant.product.id).where("showroom_variant_stocks.stock > 0").near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address)
    @purchase = Purchase.new
    @bidding = Bidding.find(session[:bidding_id])
    @variants_hash = {}
    @showroom_variant_stocks.each do |item|
      @variants_hash[item.variant.color] ||= []
      @variants_hash[item.variant.color] << { id: item.id, size: item.variant.size }
    end
    flash[:timer] = @bidding.created_at
  end
end

# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0).joins(:bidding).where(brand_ranks: { bidding_id: @bidding.id }).order(order: :desc)
# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0).joins(showroom: {brand: :brand_ranks}).reorder(order: :asc)
# ShowroomVariantStock.near(@bidding.address.street, 20, :select => "addresses.*, showroom_variant_stocks.*").joins(:address).joins(:product).where(products: { category: @bidding.category }).where("products.min_price < ?", @bidding.amount).where("products.max_price > ?", @bidding.amount).where("showroom_variant_stocks.stock > ?", 0)
