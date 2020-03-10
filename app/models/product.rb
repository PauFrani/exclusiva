class Product < ApplicationRecord
  CATEGORIES = ["jean", "pants", "shirt"]

  has_many :photos, dependent: :destroy
  has_many :variants, dependent: :destroy
  has_many :showroom_variant_stocks, through: :variants
  validates :name, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :sku_ext, presence: true
  # validates :published, presence: true
end

 # sql_query = "SELECT * FROM products as pr JOIN showroom_variant_stocks AS pi ON pr.id = pi.product_id \
 #                JOIN showrooms AS sr ON pi.showroom_id = sr.id \
 #                JOIN brands AS b ON b.id = sr.brand_id \
 #                JOIN brand_ranks AS br ON b.id = br.brand_id \
 #                where p.category = bidding.category and bidding.amount between p.min_price and p.max_price"

  # price, category, brands, location

    # sql_query = "SELECT * FROM products "

    # search products by bidding.category
    # filter products between min and max price
    # get brand ranks for bidding
    # .near(bidding.address.street, 10)
    # order products by brands
    # filter by near

    # Product.find_by_sql(sql_query)
