class Bidding < ApplicationRecord
  belongs_to :user, optional: true
  has_many :brand_ranks
  accepts_nested_attributes_for :brand_ranks
  validates :amount, presence: true

  has_one :address, as: :addressable
end
