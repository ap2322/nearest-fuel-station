class Route
  attr_reader :distance,
              :travel_time

  def initialize(route_info)
    @distance = route_info[0][:legs][0][:distance][:text]
    @travel_time = route_info[0][:legs][0][:duration][:text]
    @steps = route_info[0][:legs][0][:steps]
  end

  def directions
    @steps.map do |step|
      step[:html_instructions]
    end
  end
end
