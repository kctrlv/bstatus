require './lib/info'
require './lib/status'
require './lib/station'

class Stations
  attr_accessor :info, :status, :stations, :last_checked, :updated

  def initialize(city)
    @city = city
    @info = Info.get(city)
    @stations = {}
    create_stations
  end

  def update_status
    @status = Status.get(@city)
    @last_checked = Time.now
  end

  def parse_info
    info['data']['stations'].each do |station|
      id = station['station_id'][-4..-1]
      stations[id]        = Station.new(id)
      stations[id].name   = station['name'][0..28]
      stations[id].coords = [station['lat'], station['lon']]
    end
  end

  def parse_status
    update_status
    status['data']['stations'].each do |station|
      id                   = station['station_id'][-4..-1]
      @updated             = station['last_reported']
      stations[id].updated = station['last_reported']
      stations[id].bikes   = station['num_bikes_available']
      stations[id].docks   = station['num_docks_available']
    end
  end

  def create_stations
    parse_info
    parse_status
  end

  def last_updated
    Time.at(updated)
  end

  def target(station_ids)
    return stations if station_ids.empty?
    stations.find_all { |id, station| station_ids.include? id }
  end
end

# s = Stations.new("denver")
# s.parse_info
# s.stations
