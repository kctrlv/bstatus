module Display
  def self.id(id)
    print "#{id}\t"
  end

  def self.station_name(station_name)
    print "#{station_name.ljust(25)}\t"
  end

  def self.station_bikes(station_bikes)
    print "#{station_bikes.to_s.rjust(2, '0')}\t"
  end

  def self.station_docks(station_docks)
    print "#{station_docks.to_s.rjust(2, '0')}\n"
  end

  def self.station_headers
    puts "ID\tStation Name\t\t\tBikes\tDocks"
  end

  def self.station_status(id, name, bikes, docks)
    id(id)
    station_name(name)
    station_bikes(bikes)
    station_docks(docks)
  end

  def self.target_station_status(targets)
    targets.each do |id, station|
      self.station_status(id, station.name, station.bikes, station.docks)
    end
  end

  def self.time_data(updated)
    elapsed_seconds = (Time.now - updated).to_s.split('.')[0].rjust(2,'0')
    puts "Updated: #{updated} (#{elapsed_seconds} seconds ago)\n\n"
  end

  def self.refresh(updated, targets)
    system 'clear'
    self.time_data(updated)
    self.station_headers
    self.target_station_status(targets)
  end
end
