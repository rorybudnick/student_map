class CreateLocationsStudentsJoinTable < ActiveRecord::Migration
  def change
    create_table :locations_students, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :student, index: true
    end
  end
end
