class BrandRank < ApplicationRecord
  belongs_to :brand
  validates :order, presence: true, numericality: true
end
