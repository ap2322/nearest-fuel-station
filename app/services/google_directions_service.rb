class GoogleDirectionsService
  def directions(location_address, lat, long)
    response = conn.get('directions/json') do |req|
      req.params['origin'] = search_safe(location_address)
      req.params['destination'] = "#{lat}, #{long}"
      req.params['language'] = 'en'
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['GOOGLE_API_KEY']
    end
  end

  def search_safe(address)
    address.delete!(',')
    address.gsub(' ', '+')
  end
end
