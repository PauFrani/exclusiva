class Bidding < ApplicationRecord
  belongs_to :user, optional: true
  has_many :brand_ranks
  validates :amount, presence: true
  validates :category, presence: true
end
