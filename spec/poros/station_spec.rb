require 'rails_helper'

describe Station do
  it 'initializes with attributes' do
    service = NRELService.new
    station_info = service.nearest_station("1331 17th St LL100, Denver, CO 80202")
    station = Station.new(station_info[:fuel_stations][0])

    expect(station).to be_a(Station)
    expect(station.name).to eq("Seventeenth Street Plaza")
    expect(station.address).to eq("1225 17th St., Denver, CO 80202")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
    expect(station.distance).to eq(0.1)
    expect(station.latitude).to eq(39.7501605)
    expect(station.longitude).to eq(-104.9951224)
  end
end
