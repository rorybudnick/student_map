require 'csv'
desc "Imports a CSV file into the Locations table"
task :import_locations_csv, [:filename] => :environment do    
    CSV.foreach('locations.csv', :headers => true) do |row|
      Location.create!(row.to_hash)
    end
    Location.all.each do |location|
      set_lat_long(location)
    end
end
