class LocationsController < ApplicationController
  def index
    # @locations = [Location.select(:latitude, :longitude, :name).map{ |location| [location.name, location.latitude, location.longitude]}]
  end

  def create
    Location.create(location_params)
    set_lat_long
  end

  private
  def location_params
    params.permit(:name, :street, :street_2, :city, :state, :country, :notes)
  end

  def format_address
    @formatted_address = "#{street}, #{street_2 if street_2.present?}, #{city}, #{state}, #{country}"
  end

  def set_lat_long
    format_address
    response_body = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@formatted_address}&key=GOOGLE_MAPS_API_KEY").body
    location = response_body["results"]["geometry"]["location"]
    latitude = location["lat"]
    longitude = location["lng"]
    update!(latitude: latitude, longitude: longitude)
  end
end
