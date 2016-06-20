class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @students = @locations.map{ |location| location.formatted_student_count }
  end

  def create
    Location.create(location_params)
    set_lat_long
  end

  def set_lat_long(location)
    format_address(location)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@formatted_address}&key=#{GOOGLE_MAPS_API_KEY}")
    lat_and_long = response["results"].first["geometry"]["location"]
    latitude = lat_and_long["lat"]
    longitude = lat_and_long["lng"]
    location.update!(latitude: latitude, longitude: longitude)
  end

  def format_address(location)
    @formatted_address = "#{location.street if location.present?}, #{location.street_2 if location.street_2.present?}, #{location.city if location.city.present?}, #{location.state if location.state.present?} #{location.zip_code if location.zip_code.present?}"
  end

  private
  def location_params
    params.permit(:name, :street, :street_2, :city, :state, :zip_code, :notes)
  end

end
