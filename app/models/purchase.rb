class Purchase < ApplicationRecord
  belongs_to :showroom_variant_stock
  belongs_to :bidding
  has_many :payments
  # validates :status, presence: true
  # validates :qr, presence: true
  validates :payment_method, presence: true
end
