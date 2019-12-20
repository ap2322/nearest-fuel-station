require 'rails_helper'

describe GoogleDirectionsService do
  before(:each) do
    @google_service = GoogleDirectionsService.new
    @location_address = "1331 17th St LL100, Denver, CO 80202"
    @station_lat = 39.7501605
    @station_long = -104.9951224
  end

  it 'exists' do
    expect(@google_service).to be_a(GoogleDirectionsService)
  end

  it 'can get directions with address and station lat and long' do
    directions_info = @google_service.directions(@location_address, @station_lat, @station_long)

    expect(directions_info).to have_key(:routes)
    expect(directions_info[:routes]).to be_a(Array)
  end
end

# {:geocoded_waypoints=>
#   [{:geocoder_status=>"OK", :partial_match=>true, :place_id=>"ChIJFSt998R4bIcR0e3QWNXH9D8", :types=>["establishment", "point_of_interest", "school"]},
#    {:geocoder_status=>"OK", :place_id=>"ChIJD4rGGtt4bIcRRHCwBST10wg", :types=>["establishment", "lawyer", "point_of_interest"]}],
#  :routes=>
#   [{:bounds=>{:northeast=>{:lat=>39.7506258, :lng=>-104.9947656}, :southwest=>{:lat=>39.7494563, :lng=>-104.9968234}},
#     :copyrights=>"Map data ©2019 Google",
#     :legs=>
#      [{:distance=>{:text=>"0.2 mi", :value=>251},
#        :duration=>{:text=>"1 min", :value=>78},
#        :end_address=>"1225 17th St, Denver, CO 80202, USA",
#        :end_location=>{:lat=>39.749893, :lng=>-104.9947656},
#        :start_address=>"1331 17th St LL100, Denver, CO 80202, USA",
#        :start_location=>{:lat=>39.7506258, :lng=>-104.9968234},
#        :steps=>
#         [{:distance=>{:text=>"0.1 mi", :value=>183},
#           :duration=>{:text=>"1 min", :value=>51},
#           :end_location=>{:lat=>39.7494563, :lng=>-104.9953195},
#           :html_instructions=>"Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>",
#           :polyline=>{:points=>"mxrqFbez_S@?Va@hAyAdCoD"},
#           :start_location=>{:lat=>39.7506258, :lng=>-104.9968234},
#           :travel_mode=>"DRIVING"},
#          {:distance=>{:text=>"223 ft", :value=>68},
#           :duration=>{:text=>"1 min", :value=>27},
#           :end_location=>{:lat=>39.749893, :lng=>-104.9947656},
#           :html_instructions=>"Turn <b>left</b> onto <b>Lawrence St</b><div style=\"font-size:0.9em\">Destination will be on the left</div>",
#           :maneuver=>"turn-left",
#           :polyline=>{:points=>"cqrqFv{y_S_AsAUY"},
#           :start_location=>{:lat=>39.7494563, :lng=>-104.9953195},
#           :travel_mode=>"DRIVING"}],
#        :traffic_speed_entry=>[],
#        :via_waypoint=>[]}],
#     :overview_polyline=>{:points=>"mxrqFbez_ShFkHuAmB"},
#     :summary=>"17th St and Lawrence St",
#     :warnings=>[],
#     :waypoint_order=>[]}],
#  :status=>"OK"}
