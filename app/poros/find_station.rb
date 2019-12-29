class FindStation
  attr_reader :nearest_station, :route

  def initialize(address)
    @location_address = address
    @nearest_station = fetch_nearest_station
    @route = fetch_travel_info
  end

  def fetch_nearest_station
    service = NRELService.new
    @station_info ||= service.nearest_station(@location_address)
    Station.new(@station_info[:fuel_stations][0])
  end

  def fetch_travel_info
    service = GoogleDirectionsService.new
    @travel_info_raw ||= service.directions(@location_address, nearest_station.latitude, nearest_station.longitude)
    Route.new(@travel_info_raw[:routes])
  end
end
