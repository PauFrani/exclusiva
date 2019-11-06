class Bidding < ApplicationRecord
  belongs_to :user, optional: true
  has_many :brand_ranks
  validates :amount, presence: true
  validates :category, presence: true

  has_one :address, as: :addressable
end
