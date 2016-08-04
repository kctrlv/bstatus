module URL
  def self.base(city)
    "https://gbfs.bcycle.com/bcycle_#{city}/gbfs.json"
  end

  def self.info(city)
    "https://gbfs.bcycle.com/bcycle_#{city}/station_information.json"
  end

  def self.status(city)
    "https://gbfs.bcycle.com/bcycle_#{city}/station_status.json"
  end
end
