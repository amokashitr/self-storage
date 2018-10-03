class Unit < ApplicationRecord

  include ImageSetter, AmenitySetter

  has_many_attached :images

  belongs_to :storage_unit
  has_many :unit_amenities, dependent: :destroy
  has_many :amenities, through: :unit_amenities

  scope :associated_amenities, ->(features) {
    joins(:amenities).where('amenities.feature IN (?)', features).references(:amenities)
  }

  attr_accessor :size
  
  def size
    length.to_s + ' X ' + breadth.to_s
  end

end
