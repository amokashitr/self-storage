class AlterAddressesColumn < ActiveRecord::Migration[5.2]
  def up
    add_column :addresses, :country, :string
    add_column :addresses, :address_line_1, :string
    add_column :addresses, :administrative_area, :string
    remove_column :addresses, :state, :string
  end

  def down
    remove_column :addresses, :country, :string
    remove_column :addresses, :address_line_1, :string
    remove_column :addresses, :administrative_area, :string
    add_column :addresses, :state, :string
  end
end
