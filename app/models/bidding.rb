class Bidding < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :category, presence: true
end
