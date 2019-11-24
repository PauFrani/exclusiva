class Brand < ApplicationRecord
  has_many :showrooms, dependent: :destroy
  has_many :brand_ranks, dependent: :destroy
  has_many :showroom_variant_stocks, through: :showrooms
  validates :name, presence: true
end
