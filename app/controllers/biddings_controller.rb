class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy]

  def new
    @bidding = Bidding.new
  end

  def create
    @bidding = Bidding.new(biddings_params)
    @bidding.user = current_user if user_signed_in?
    if @bidding.save
      session[:bidding_id] = @bidding.id
      redirect_to category_biddings_path
    else
      render :new
    end
  end

  def update
    @bidding = Bidding.find(params[:id])
    @bidding.update(biddings_params)
    if request.referrer.include? 'category'
      redirect_to brands_biddings_path
    elsif request.referrer.include? 'brands'
      redirect_to new_bidding_path # location_bidding_path
    elsif request.referrer.include? 'location'
      redirect_to new_bidding_path # pagina de resultados
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
    @bidding = Bidding.new
  end

  private

  def biddings_params
    params.require(:bidding).permit(:category, :amount, brand_ranks_attributes: [:order, :brand_id])
  end

  def set_bidding
    @bidding = Bidding.find(params[:id])
  end

end
