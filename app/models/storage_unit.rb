class StorageUnit < ApplicationRecord

  include ImageSetter, AmenitySetter

  has_many_attached :images

  has_many :units
  has_many :storage_unit_amenities
  has_many :amenities, through: :storage_unit_amenities
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

  scope :city_zip, ->(city_zip) {
    joins(:address).where('city ilike ?', "%#{city_zip}%").references(:addresses).or(
      joins(:address).where('zip ilike ?', "%#{city_zip}%").references(:addresses)
    )
  }

  scope :associated_amenities, ->(feature) {
    joins(:amenities).where('amenities.feature like ?', "%#{feature}%").references(:amenities)
  }

  scope :unit_size, ->(length, breadth) {
    joins(:units).where('units.length = ?', length).references(:units).
    joins(:units).where('units.breadth = ?', breadth).references(:units)
  }

  # Currently the rating is set as default as review / rating feature has not been implemented
  before_create :set_rating
  
  def set_rating
    self.rating = 4.3
  end
  # ................................................

end
