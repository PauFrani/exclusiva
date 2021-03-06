class PurchasesController < ApplicationController
  # skip_forgery_protection only: :create
  protect_from_forgery except: :create
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
    # make payment
    # if payment is ok then
      # save the purchase
    # if the user doesnt have customer_id then
      # create customer in mp
      # save customer id to user table
      # create card in mp
      # save card_id in user table

    @showroom_variant_stock = ShowroomVariantStock.find(params[:showroom_variant_stock_id])
    @purchase = @showroom_variant_stock.purchases.build(purchase_params)
    @purchase.bidding_id = session[:bidding_id]
    @payment = Payment.new
    @payment.purchase = @purchase
    @payment.status = 'Pending'
    @purchase.status = 'Pending'
    @purchase.payment_method = params[:payment_method_id]

    @payment.save!

    require 'mercadopago'
    $mp = MercadoPago.new(ENV["MP_PRODUCTION_ACCESS_TOKEN"])

    token = params[:token]
    payment_method_id = params[:payment_method_id]
    installments = 1
    issuer_id = params[:issuer_id]

    # payment hash for mp
    payment = {}
    payment[:transaction_amount] = @purchase.bidding.amount
    payment[:token] = token
    payment[:description] = @purchase.showroom_variant_stock.variant.product.description
    payment[:installments] = installments
    payment[:issuer_id] = issuer_id
    payment[:payer] = {
      email: current_user.email
    }

    payment_response = $mp.post("/v1/payments", payment)

    # response = {}
    # response[:payment_response] = payment_response

    if payment_response["status"] == "201" && payment_response["response"]["status"] == "approved"

      # @payment.status = 'Cobrado'

      #if !current_user.mp_customer_id

      search_customer = $mp.get("/v1/customers/search", { email: current_user.email })

      if !search_customer["response"]["results"].empty?
        current_user.mp_card_id = search_customer["response"]["results"][0]["cards"][0]["id"]
        current_user.mp_customer_id = search_customer["response"]["results"][0]["id"]
        current_user.save

      else
        # create a customer
        customer_response = $mp.post("/v1/customers", { email: current_user.email })

        # save customer_id to user
        current_user.mp_customer_id = customer_response["response"]["id"]

        # add a card to the customer
        card_response = $mp.post("/v1/customers/#{customer_response["response"]["id"]}/cards", { token: token })

        current_user.mp_card_id  = card_response["response"]["id"]
        # save card_id to user
        # response[:customer_response] = customer_response
        # response[:card_response] = card_response
        current_user.mp_card_id = card_response["response"]["id"]
        current_user.save!
        raise
      end
    end

    if @payment.save
      @purchase.save
      redirect_to purchase_path(@purchase)
    else
      render :new
    end
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.status = params[:status]
    if @purchase.save
      flash[:notice] = "La compra ha sido #{@purchase.status.downcase}."
    else
      flash[:alert] = "La compra NO ha sido #{@purchase.status.downcase}."
    end
    redirect_to dashboard_path
  end

  def show
    @purchase = Purchase.find(params[:id])
    if session[:bidding_id]
      @bidding = Bidding.find(session[:bidding_id])
    else
      redirect_to root_path
    end
  end

  def index
    @purchase = Purchase.all
  end

   private

  def purchase_params
    params.permit(:payment_method, :showroom_variant_stock_id)
  end
end
