require './lib/bcycle'
require 'pry'

class Runner
  attr_accessor :bcycle, :last_request, :stations

  def initialize
    @bcycle = BCycle.new("denver")
    @stations = Stations.new("denver")
    @last_request = Time.now
  end

  def update_stations
    stations.update_status
  end

  def check_update(time_to_wait)
    old = bcycle.updated
    if Time.now - last_request > time_to_wait
      bcycle.update_data
      @last_request = Time.now
      update_stations if bcycle.updated != old
    end
  end

  def gen_line_1
    check_update(5) if Time.now - bcycle.updated > 65
    updated = bcycle.updated
    elapsed = (Time.now - updated).to_s.split('.')[0].rjust(2,'0')
    puts "Updated: #{updated} (#{elapsed} seconds ago)\n\n"
  end

  def gen_line_2
    puts "ID\tStation Name\tBikes\tDocks"
  end

  def gen_line_3
    [[1799, '1450 Wazee'], [1666,'16th & Market'], [3397,'16th & Chestnut']].each do |id, name|
      bikes, docks = stations.status_single(id)
      print "#{id}\t"
      print "#{name}\t"
      print "#{bikes}\t"
      print "#{docks}\n"
    end
  end

  def display_output
    gen_line_1
    gen_line_2
    gen_line_3
  end
end


r = Runner.new

loop do
  system 'clear'
  r.display_output
  sleep(1)
end



# $last_updated = BCycle.new("denver").updated
#
# def update_display
#   system 'clear'
#   puts Time.now
#   b = BCycle.new("denver")
#   return nil if $last_updated == b.updated
#   $last_updated = b.updated
#   puts "Checking stations"
#   s = Stations.new("Denver")
#   targets = ['1799', '1686', '3397'] #Wazee, Market, Union
#   s = s.status.select do |station|
#     targets.include? station['station_id'][-4..-1]
#   end
#   puts targets
# end
#
#
#
#
#
#
# loop{
#   sleep(3)
#   update_display
# }
