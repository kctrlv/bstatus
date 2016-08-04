class Station
  attr_accessor :updated, :bikes, :docks, :coords, :name, :id, :log

  def initialize(station_id)
    @id = station_id
    @log = []
  end
end
