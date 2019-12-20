require 'rails_helper'

describe NRELService do
  before(:each) do
    @nrel_service = NRELService.new
    @location_address = "1331 17th St LL100, Denver, CO 80202"
  end

  it 'exists' do
    expect(@nrel_service).to be_a(NRELService)
  end

  it 'can get the closest station by address' do
    closest_station_info = @nrel_service.nearest_station(@location_address)

    expect(closest_station_info).to have_key(:fuel_stations)
    expect(closest_station_info[:fuel_stations]).to be_a(Array)
    expect(closest_station_info[:fuel_stations].length).to eq(1)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:distance)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:station_name)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:fuel_type_code)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:latitude)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:longitude)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:city)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:state)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:street_address)
    expect(closest_station_info[:fuel_stations][0]).to have_key(:zip)
  end
end
#
# {
#     "latitude": 39.750614,
#     "longitude": -104.996775,
#     "location_country": "US",
#     "precision": {
#         "value": 9,
#         "name": "premise",
#         "types": [
#             "premise"
#         ]
#     },
#     "station_locator_url": "http://www.afdc.energy.gov/afdc/locator/stations/",
#     "total_results": 108,
#     "station_counts": {
#         "total": 314,
#         "fuels": {
#             "BD": {
#                 "total": 0
#             },
#             "E85": {
#                 "total": 1
#             },
#             "ELEC": {
#                 "total": 307,
#                 "stations": {
#                     "total": 101
#                 }
#             },
#             "HY": {
#                 "total": 0
#             },
#             "LNG": {
#                 "total": 0
#             },
#             "CNG": {
#                 "total": 1
#             },
#             "LPG": {
#                 "total": 5
#             }
#         }
#     },
#     "offset": 0,
#     "fuel_stations": [
#         {
#             "access_code": "public",
#             "access_days_time": "MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified",
#             "access_detail_code": null,
#             "cards_accepted": null,
#             "date_last_confirmed": "2019-12-20",
#             "expected_date": null,
#             "fuel_type_code": "ELEC",
#             "groups_with_access_code": "Public",
#             "id": 147967,
#             "open_date": null,
#             "owner_type_code": null,
#             "status_code": "E",
#             "station_name": "Seventeenth Street Plaza",
#             "station_phone": "800-663-5633",
#             "updated_at": "2019-12-20T10:09:49Z",
#             "facility_type": null,
#             "geocode_status": "GPS",
#             "latitude": 39.7501605,
#             "longitude": -104.9951224,
#             "city": "Denver",
#             "intersection_directions": null,
#             "plus4": null,
#             "state": "CO",
#             "street_address": "1225 17th St.",
#             "zip": "80202",
#             "country": "US",
#             "bd_blends": null,
#             "cng_dispenser_num": null,
#             "cng_fill_type_code": null,
#             "cng_psi": null,
#             "cng_renewable_source": null,
#             "cng_total_compression": null,
#             "cng_total_storage": null,
#             "cng_vehicle_class": null,
#             "e85_blender_pump": null,
#             "e85_other_ethanol_blends": null,
#             "ev_connector_types": [
#                 "J1772"
#             ],
#             "ev_dc_fast_num": null,
#             "ev_level1_evse_num": null,
#             "ev_level2_evse_num": 2,
#             "ev_network": "SemaCharge Network",
#             "ev_network_web": "http://www.semacharge.com/",
#             "ev_other_evse": null,
#             "ev_pricing": "$1.00-$6.00/Hr Variable Parking Fee",
#             "ev_renewable_source": null,
#             "hy_is_retail": null,
#             "hy_pressures": null,
#             "hy_standards": null,
#             "hy_status_link": null,
#             "lng_renewable_source": null,
#             "lng_vehicle_class": null,
#             "lpg_primary": null,
#             "lpg_nozzle_types": null,
#             "ng_fill_type_code": null,
#             "ng_psi": null,
#             "ng_vehicle_class": null,
#             "access_days_time_fr": null,
#             "intersection_directions_fr": null,
#             "bd_blends_fr": null,
#             "groups_with_access_code_fr": "Public",
#             "ev_pricing_fr": null,
#             "ev_network_ids": {
#                 "station": [
#                     "1114"
#                 ],
#                 "posts": [
#                     "2642",
#                     "2643"
#                 ]
#             },
#             "distance": 0.0934,
#             "distance_km": 0.15031
#         }
#     ]
# }
