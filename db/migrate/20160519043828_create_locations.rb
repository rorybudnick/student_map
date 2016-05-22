class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :country
      t.text :notes
      t.timestamps null: false
    end
  end
end
