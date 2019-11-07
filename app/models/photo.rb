class Photo < ApplicationRecord
  belongs_to :product
  validates :url_photo, presence: true
end
