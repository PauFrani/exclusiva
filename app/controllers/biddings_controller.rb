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
      redirect_to category_biddings_path
    else
      render :new
    end
  end

  def update
    @bidding = Bidding.find(params[:id])
    if @bidding.expired?
      flash[:alert] = 'EL tiempo de tu oferta finalizó!'
      redirect_to root_path
    else
      if request.referrer.include? 'category'
        @bidding.update(biddings_params)
        redirect_to brands_biddings_path
      elsif request.referrer.include? 'brands'
        @bidding.update(biddings_params)
        redirect_to location_biddings_path # location_bidding_path
      elsif request.referrer.include? 'location'
        begin
          @bidding.address = Address.new(address_params)
        rescue
          flash[:notice] = "¡Las ofertas son únicas, debe crear una nueva oferta!"
          return redirect_to root_path
        end
        @bidding.save
        redirect_to showroom_variant_stocks_path # pagina de resultados
      end
    end
  end

  def category
    @bidding = Bidding.find(session[:bidding_id])
  end

  def brands
    @bidding = Bidding.find(session[:bidding_id])
    @brands = Brand.all
    @brands.each do |brand|
      @bidding.brand_ranks.build(brand: brand)
    end
  end

  def location
    @bidding = Bidding.find(session[:bidding_id])
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
