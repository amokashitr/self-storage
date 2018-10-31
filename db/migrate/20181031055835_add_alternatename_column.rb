class AddAlternatenameColumn < ActiveRecord::Migration[5.2]
  def up
    add_column :storage_units, :alternatename, :string
  end

  def down
    remove_column :storage_units, :alternatename, :string
  end
end
