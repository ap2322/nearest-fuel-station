class SearchController < ApplicationController
  def index
    station = FindStation.new(params[:location])
    render locals: {station: station.fetch_nearest_station}
  end
end
