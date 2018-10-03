class StorageUnit < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]

  include ImageSetter, AmenitySetter

  has_many_attached :images

  has_many :units, dependent: :destroy
  has_many :storage_unit_amenities, dependent: :destroy
  has_many :amenities, through: :storage_unit_amenities
  has_one :address, dependent: :destroy

  validates_uniqueness_of :name

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

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

end
