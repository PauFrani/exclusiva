class Address < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :addressable, polymorphic: true
  # VERIFICAR AL AGREGAR GEOCODER
  # validates :street, presence: true
end
