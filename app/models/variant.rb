class Variant < ApplicationRecord
  belongs_to :product
  has_many :showroom_variant_stocks
  validates :color, presence: true
  validates :size, presence: true
end
