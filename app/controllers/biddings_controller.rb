class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy]

    # def new
    #   @bidding = Bidding.new
    # end

  def create
    @bidding = Bidding.new(biddings_params)
    @bidding.user = current_user if user_sign_in?
    if @bidding.save
      redirect_to category_biddings_path
    else
      render :new
    end
  end

  def update
    @bidding.update
    redirect_to brands_biddings_path
  end

  def category
    @bidding = Bidding.new
  end

  def brands
    @bidding = Bidding.new
  end

  def location
    @bidding = Bidding.new
  end

  private

  def biddings_params
    requiere(:biddings).permit(:category, :amount)
  end
  def set_bidding
    @bidding = Bidding.find(params[:id])
  end

end
