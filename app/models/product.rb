class Product < ApplicationRecord
  CATEGORIES = ["jean", "pants", "shirt"]
  has_many :products_item
  has_many :photos, dependent: :destroy
  has_many :variants
  validates :name, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :sku_ext, presence: true
end
