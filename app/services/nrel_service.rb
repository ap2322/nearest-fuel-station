class NRELService

  def nearest_station(location_address)
    response = conn.get('nearest.json') do |req|
      req.params['location'] = location_address
      req.params['limit'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:api_key] = ENV['NREL_API_KEY']
    end
  end
end
