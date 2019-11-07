class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @bidding = Bidding.find(session[:bidding_id])
    @products = Product.search(@bidding)
    #@products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.search(@bidding)
  end
end
