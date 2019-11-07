class Purchase < ApplicationRecord
  belongs_to :product_item
  belongs_to :bidding
  has_many :payments
  validates :status, presence: true
  validates :qr, presence: true
  validates :payment_method, presence: true
end
