class Station
  attr_reader :name,
              :fuel_type,
              :latitude,
              :longitude,
              :distance,
              :access_times

  def initialize(info)
    @info = info
    @name = info[:station_name]
    @fuel_type = info[:fuel_type_code]
    @latitude = info[:latitude]
    @longitude = info[:longitude]
    @distance = info[:distance].round(1)
    @access_times = info[:access_days_time]
  end

  def address
    @info[:street_address] + ', ' + @info[:city] + ', ' + @info[:state] + ' ' + @info[:zip]
  end

end
