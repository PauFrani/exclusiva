class PurchasesController < ApplicationController
  skip_forgery_protection only: :make_payment

  def new
    @purchase = Purchase.new
    @showroom_variant_stock = ShowroomVariantStock.find(params[:showroom_variant_stock_id])
    if session[:bidding_id]
      @bidding = Bidding.find(session[:bidding_id])
    else
      redirect_to root_path
    end
    # @bidding = Bidding.find(params[:id])
  end

  def create
    @showroom_variant_stock = ShowroomVariantStock.find(params[:showroom_variant_stock_id])
    @purchase = @showroom_variant_stock.purchases.build(purchase_params)
    @purchase.bidding_id = session[:bidding_id]
    if @purchase.save!
      redirect_to purchase_confirm_payment_path(@purchase)
    else
      render :new
    end
  end

  def confirm_payment
    @purchase = Purchase.find(params[:purchase_id])
  end

  def make_payment
    raise
  end

  def show
    @purchase = Purchase.find(params[:id])
    if session[:bidding_id]
      @bidding = Bidding.find(session[:bidding_id])
    else
      redirect_to root_path
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:payment_method, :showroom_variant_stock_id)
  end
end
