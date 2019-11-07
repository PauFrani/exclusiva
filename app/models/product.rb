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
    sql_query = "SELECT * FROM products as pr JOIN product_items AS pi ON pr.id = pi.product_id \
                JOIN showrooms AS sr ON pi.showroom_id = sr.id \
                JOIN brands AS b ON b.id = sr.brand_id \
                JOIN brand_ranks AS br ON b.id = br.brand_id \
                where p.category = bidding.category and bidding.amount between p.min_price and p.max_price"
    Product.find_by_sql(sql_query)
  end
end
