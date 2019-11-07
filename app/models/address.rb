class Address < ApplicationRecord
  geocoded_by :street
  belongs_to :addressable, polymorphic: true
  after_validation :geocode, if: :will_save_change_to_street?
  # VERIFICAR AL AGREGAR GEOCODER
  # validates :street, presence: true
end
