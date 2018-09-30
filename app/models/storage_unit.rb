class StorageUnit < ApplicationRecord

  has_many_attached :images

  has_many :units
  has_many :storage_unit_amenities
  has_many :amenities, through: :storage_unit_amenities
  has_one :address

  scope :city_zip, ->(city_zip) {
    joins(:address).where('city ilike ?', "%#{city_zip}%").references(:addresses).or(
      joins(:address).where('zip ilike ?', "%#{city_zip}%").references(:addresses)
    )
  }

  scope :associated_amenities, ->(feature) {
    joins(:amenities).where('amenities.feature like ?', "%#{feature}%").references(:amenities)
  }

  def update_with_images(image_ids, storage_unit_params)
    unless image_ids.nil?
      image_ids.each do |image_id|
        self.images.find_by(blob_id: image_id).purge
      end
    end
    return self.update(storage_unit_params)
  end

end
