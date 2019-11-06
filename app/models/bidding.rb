class Bidding < ApplicationRecord
  belongs_to :user, optional: true
  has_many :brand_ranks
  accepts_nested_attributes_for :brand_ranks
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

  validates :amount, presence: true
end
