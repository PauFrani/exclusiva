class ProductsController < ApplicationController
  def index
    @bidding = Bidding.new(params[:id])
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.search(@bidding)
  end
end
