class Purchase < ApplicationRecord
  belongs_to :bidding
  belongs_to :showroom_variant_stock
  has_one :product, through: :showroom_variant_stock
  has_many :payments, dependent: :destroy
  # validates :status, presence: true
  # validates :qr, presence: true
  validates :payment_method, presence: true
end
