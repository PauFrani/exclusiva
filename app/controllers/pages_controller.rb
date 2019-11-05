class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bidding = Bidding.new

  end

  def cards
  end
end
