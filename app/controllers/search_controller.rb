class SearchController < ApplicationController
  def index
    station = FindStation.new(params[:location])
    render locals: {station: station.nearest_station}
  end
end
