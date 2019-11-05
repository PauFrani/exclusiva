class Showroom < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  validates :phone_mumber, presence: true
  validates :email, presence: true
end
