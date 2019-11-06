class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  # VERIFICAR AL AGREGAR GEOCODER
  # validates :street, presence: true
end
