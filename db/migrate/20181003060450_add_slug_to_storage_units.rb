class AddSlugToStorageUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :storage_units, :slug, :string, unique: true
  end
end
