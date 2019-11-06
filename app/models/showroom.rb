class Showroom < ApplicationRecord
  belongs_to :brand
  has_many :products_item
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  has_one :address, as: :addressable
  # validates :address, presence: true
end
