class Variant < ApplicationRecord
  belongs_to :product
  validates :color, presence: true
  validates :size, presence: true
end
