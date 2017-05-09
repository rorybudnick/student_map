class CreateStudentsLocationsJoinTable < ActiveRecord::Migration
  def change
    create_table :students_locations, id: false do |t|
      t.integer :student_id
      t.integer :location_id
    end
  end
end
