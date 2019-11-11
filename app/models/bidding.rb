class Bidding < ApplicationRecord
  belongs_to :user, optional: true
  has_one :purchase

  has_many :brand_ranks, dependent: :destroy

  accepts_nested_attributes_for :brand_ranks
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

  validates :amount, presence: true

  def expired?
    if (Time.now - self.created_at)/60 > 1000
      return true
    end
  end

end
