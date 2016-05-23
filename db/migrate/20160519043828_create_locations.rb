class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :notes
      t.decimal :latitude, { precision: 10, scale: 6 }
      t.decimal :longitude, { precision: 10, scale: 6 }
      t.timestamps null: false
    end
  end
end
