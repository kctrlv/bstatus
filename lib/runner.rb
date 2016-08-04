require 'timeout'
require './lib/stations'
require './lib/display'

class Runner
  attr_accessor :stations, :targets

  def initialize(city, target_ids = nil)
    @stations = Stations.new(city)
    @targets  = stations.target(target_ids)
  end

  def run
    repeat(display) until false
  end

  def repeat(display)
    update_every_minute
    display
    sleep(1)
  end

  def update_every_minute
    minute_passed = Time.now - stations.last_updated > 60
    check_for_update(3) if minute_passed
  end

  def check_for_update(delay)
    waited = Time.now - stations.last_checked
    stations.parse_status if waited > delay
  end

  def display
    system 'clear'
    Display.time_data(stations.last_updated)
    Display.station_headers
    Display.target_station_status(targets)
  end
end

target_ids = ['1799', '1686', '3397']
# target_ids = Array('1800'..'2000')
r = Runner.new('denver', target_ids)
r.run
