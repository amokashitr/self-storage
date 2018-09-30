module AmenitySetter

  def update_amenities(amenity_ids)
    self.amenities = Amenity.where(id: amenity_ids)
  end

end