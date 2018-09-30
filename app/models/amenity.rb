class Amenity < ApplicationRecord

  CATEGORY = [
              'ACCESS', 'PROPERTY COVERAGE', 'ADMINISTRATION', 'MOVING', 'DISCOUNTS', 'BILLING',
              'VEHICLE STORAGE REQUIREMENTS', 'SECURITY FEATURES'
             ].freeze
  
  has_many :unit_amenities
  has_many :units, through: :unit_amenities

  has_many :storage_unit_amenities
  has_many :storage_units, through: :storage_unit_amenities

  scope :category, ->(category) { where('category ilike ?', "%#{category}%") }

end
