class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :grade
      t.text :days_and_times, default: '{}'
      t.text :notes
      t.timestamps null: false
    end
  end
end
