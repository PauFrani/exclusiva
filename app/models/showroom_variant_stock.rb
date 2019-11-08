class ShowroomVariantStock < ApplicationRecord
  belongs_to :showroom
  belongs_to :variant
  has_one :product, through: :variant
  has_many :purchase, dependent: :destroy
  validates :stock, presence: true

end
