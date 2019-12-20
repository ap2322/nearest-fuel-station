class SearchController < ApplicationController
  def index
    closest_station = FindStation.new(params[:location])
    render locals: {station: closest_station}
  end
end
