class FindStation
  def initialize(address)
    @location_address = address

  end

  def fetch_nearest_station
    service = NRELService.new
    station_info = service.nearest_station(@location_address)
    Station.new(station_info[:fuel_stations][0])
  end
end
