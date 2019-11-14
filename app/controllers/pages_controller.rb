class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def cards
  end

  def dashboard
    @purchases_pending = Purchase.where(status: "Pending")
    @purchases_confirmed = Purchase.where(status: "Confirmed")
    @purchases_cancelled = Purchase.where(status: "Cancelled")
  end
end
