class Unit < ApplicationRecord

  include ImageSetter, AmenitySetter

  has_many_attached :images

  belongs_to :storage_unit
  has_many :unit_amenities
  has_many :amenities, through: :unit_amenities

  scope :associated_amenities, ->(features) {
    joins(:amenities).where('amenities.feature IN (?)', features).references(:amenities)
  }

end
