class Product < ApplicationRecord
  belongs_to :show_room
  validates :name, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :sku_ext, presence: true
  validates :published, presence: true

  def self.search(bidding)
    sql_query = "select * from "
    #where(sql_query, query: "%#{query}%")
  end
end
