# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# Create locations
locations_csv_text = File.read(Rails.root.join('lib', 'seeds', 'locations.csv'))
csv = CSV.parse(locations_csv_text, :headers => true, :encoding => 'ISO-8859-1')

def format_address(location)
  @formatted_address = "#{location.street if location.present?}, #{location.street_2 if location.street_2.present?}, #{location.city if location.city.present?}, #{location.state if location.state.present?} #{location.zip_code if location.zip_code.present?}"
end

def set_lat_long(location)
  format_address(location)
  response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@formatted_address}&key=#{GOOGLE_MAPS_API_KEY}")
  lat_and_long = response["results"].first["geometry"]["location"]
  latitude = lat_and_long["lat"]
  longitude = lat_and_long["lng"]
  location.update!(latitude: latitude, longitude: longitude)
end

csv.each do |row|
  location = Location.new
  location.name = row['name']
  location.street = row['street']
  location.city = row['city']
  location.state = row['state']
  location.zip_code = row['zip_code']
  location.notes = row['notes']
  location.latitude = row['latitude']
  location.longitude = row['type']
  location.save
  set_lat_long(location)
end

# Create students
students_csv_text = File.read(Rails.root.join('lib', 'seeds', 'students.csv'))
csv = CSV.parse(students_csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  student = Student.new
  student.first_name = row['first_name']
  student.last_name = row['last_name']
  student.grade = row['grade']
  student.days_and_times = row['days_and_times']
  student.notes = row['notes']
  student.save
end

puts "Database seeded with locations and students."
