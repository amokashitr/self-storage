class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :street
      t.string :city
      t.string :zip
      t.string :state
      t.references :storage_unit, foreign_key: true
      t.timestamps
    end
  end
end
