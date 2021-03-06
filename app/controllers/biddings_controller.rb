class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def new
    @bidding = Bidding.new
  end

  def create
    @bidding = Bidding.new(biddings_params)
    @bidding.user = current_user if user_signed_in?
    if @bidding.save!
      session[:bidding_id] = @bidding.id
      session[:category] = @bidding.category
      redirect_to brands_biddings_path
    else
      render :new
    end
  end

  def update
    @bidding = Bidding.find(params[:id])
    if @bidding.expired?
      flash[:alert] = 'El tiempo de tu oferta finalizó!'
      redirect_to root_path
    else
      if request.referrer.include? 'brands'
        @bidding.update(biddings_params)
        begin
          @bidding.address = Address.new(address_params)
          @bidding.update(biddings_params)
        rescue
          flash[:notice] = "¡Las ofertas son únicas, debe crear una nueva oferta!"
          return redirect_to root_path
        end
        @bidding.save
        redirect_to showroom_variant_stocks_path # location_bidding_path
      end
    end
  end

  def category
    @bidding = Bidding.find(session[:bidding_id])
    flash[:timer] = @bidding.created_at
  end

  def brands
    @bidding = Bidding.find(session[:bidding_id])
    @brands = Brand.joins(:showrooms).joins(showroom_variant_stocks: {variant: :product}).where(products: { category: @bidding.category }).all.uniq
    @brands.each do |brand|
      @bidding.brand_ranks.build(brand: brand)
    end
    flash[:timer] = @bidding.created_at
  end

  def location
    @bidding = Bidding.find(session[:bidding_id])
    flash[:timer] = @bidding.created_at
  end

  private

  def biddings_params
    params.require(:bidding).permit(:category, :amount, brand_ranks_attributes: [:order, :brand_id], address_attributes: [:street])
  end

  def address_params
    params[:bidding][:address].permit(:street)
  end

  def set_bidding
    @bidding = Bidding.find(params[:id])
  end
end
