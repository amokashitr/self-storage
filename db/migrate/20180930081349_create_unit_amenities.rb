class CreateUnitAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_amenities do |t|
      t.references :unit, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
