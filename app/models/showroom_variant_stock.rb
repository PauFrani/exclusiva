class ShowroomVariantStock < ApplicationRecord
  belongs_to :showroom
  belongs_to :variant
  has_one :product, through: :variant
  has_many :purchases, dependent: :destroy
  has_one :address, through: :showroom

  validates :stock, presence: true

  reverse_geocoded_by "addresses.latitude", "addresses.longitude"
end
