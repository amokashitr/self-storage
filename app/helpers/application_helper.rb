module ApplicationHelper

  def load_size_ranges
    [
      5, 10, 15, 20, 25, 30,
      35, 40, 45, 50
    ]
  end

  def load_size(storage_unit)
    sizes = []
    storage_unit.units.each do |unit|
      sizes << unit.size
    end
    sizes.sort.uniq
  end

  def load_amenities(storage_unit)
    amenities = []
    storage_unit.units.each do |unit|
      unit.amenities.each do |amenity|
        amenities << amenity.feature
      end
    end
    amenities.uniq
  end

  def get_address(storage_unit)
    storage_unit_address = ''
    if storage_unit.address.present?
      address = storage_unit.address
      if address.street.present?
        storage_unit_address +=  (address.street + ' ')
      end

      if address.address_line_1.present?
        storage_unit_address +=  (address.address_line_1 + ' ')
      end

      if address.city.present?
        storage_unit_address +=  (address.city + ' ')
      end
      if address.administrative_area.present?
        storage_unit_address +=  (address.administrative_area + ' ')
      end
      if address.zip.present?
        storage_unit_address += (address.zip + ' ')
      end
      if address.country.present?
        storage_unit_address += (address.country)
      end
    end
    storage_unit_address
  end

  def load_size_of_all_units
    sizes = []
    Unit.all.each do |unit|
      sizes << unit.size
    end
    sizes.sort.uniq
  end

end
