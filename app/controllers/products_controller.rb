class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @bidding = Bidding.new(params[:id])
    @products = Product.all

    # @address = @bidding.address.geocoded
    # @markers = @address.map do |address|
    #   {
    #     lat: address.latitude,
    #     lng: address.longitude
    #   }
    # end
  end

  def show
    @product = Product.find(params[:id])
  end
end
