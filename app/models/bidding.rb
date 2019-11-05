class Bidding < ApplicationRecord
  belongs_to :user
  has_many :brandRanks
  validates :amount, presence: true
  validates :category, presence: true
end
