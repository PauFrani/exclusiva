class Purchase < ApplicationRecord
  belongs_to :bidding
  belongs_to :showroom_variant_stock
  has_many :payments
  # validates :status, presence: true
  # validates :qr, presence: true
  validates :payment_method, presence: true
end
