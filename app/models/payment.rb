class Payment < ApplicationRecord
  belongs_to :purchase
  validates :status, presence: true
end
