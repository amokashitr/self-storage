class CreateStorageUnitAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_unit_amenities do |t|
      t.references :storage_unit, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
