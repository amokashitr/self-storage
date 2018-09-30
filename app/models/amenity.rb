class Amenity < ApplicationRecord
  
  has_many :unit_amenities
  has_many :units, through: :unit_amenities

  has_many :storage_unit_amenities
  has_many :storage_units, through: :storage_unit_amenities

end
