class Variant < ApplicationRecord
  belongs_to :product
  validates :stock, presence: true
  validates :color, presence: true
  validates :size, presence: true
end
