class ProductItem < ApplicationRecord
  belongs_to :showroom
  belongs_to :product
  has_many :purchase, dependent: :destroy
  validates :stock, presence: true

  def address
    showroom.address.street
  end
end
