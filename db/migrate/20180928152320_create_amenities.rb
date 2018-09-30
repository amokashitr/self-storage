class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :category
      t.text :feature
      t.timestamps
    end
  end
end
