class CreateStorageUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_units do |t|
      t.string :name
      t.numeric :rating
      t.text :about
      t.text :contact_no
      t.timestamps
    end
  end
end
