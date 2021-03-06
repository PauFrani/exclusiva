class Showroom < ApplicationRecord
  belongs_to :brand
  has_many :showroom_variant_stocks
  has_many :purchases, through: :showroom_variant_stocks
   has_many :variants, through: :showroom_variant_stocks
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  has_one :address, as: :addressable
  # validates :address, presence: true
end
