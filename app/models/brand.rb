 class Brand < ApplicationRecord
  has_many :showrooms, dependent: :destroy
  has_many :brand_ranks, dependent: :destroy
  validates :name, presence: true
end
