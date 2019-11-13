class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def cards
  end

  def dashboard
    @purchases = Purchase.all
  end
end
