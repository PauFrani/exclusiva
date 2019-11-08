class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @product_item = ProductItem.find(params[:product_item_id])
    if session[:bidding_id]
      @bidding = Bidding.find(session[:bidding_id])
    else
      redirect_to root_path
    end
     # @bidding = Bidding.find(params[:id])
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    redirect_to  purchase_path(@purchase)
  end


  def show
    @purchase = Purchase.find(params[:id])
    @product_item = ProductItem.find(params[:product_item_id])
  end


end
