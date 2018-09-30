class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :length
      t.integer :breadth
      t.integer :quantity
      t.numeric :rate
      t.text :offer
      t.references :storage_unit, foreign_key: true
      t.timestamps
    end
  end
end
