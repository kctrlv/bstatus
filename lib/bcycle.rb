require 'httparty'

class BCycle
  attr_reader :data, :root, :city, :urls, :updated

  def initialize(city)
    @city     = city.downcase
    @root     = "https://gbfs.bcycle.com/bcycle_#{@city}/gbfs.json"
    @data     = nil
    update_data
    raise ArgumentError.new("Invalid City") if invalid_city?
    @urls     = parse_urls
    @updated  = parse_updated
  end

  def request_data(url = @root)
    HTTParty.get(url).parsed_response
  end

  def update_data
    @data = request_data
    @updated  = parse_updated
  end

  def invalid_city?
    @data['code'] == 404
  end

  def parse_urls
    urls = @data['data']['en']['feeds'] # array of hashes
    urls.map { |url| url['url'] }
  end

  def parse_updated
    Time.at(@data['last_updated'].to_i)
  end
end

class Stations < BCycle
  attr_accessor :status

  def initialize(city)
    super
    @root = BCycle.new(city).urls[3]
    @data = request_data
    @status = @data['data']['stations']
  end

  def update_status
    @status  = request_data['data']['stations']
  end

  def status_single(id)
    s = status.find { |station| station['station_id'] == "bcycle_#{city}_#{id}"}
    [s['num_bikes_available'], s['num_docks_available']]
  end
end




  # def self.stations_request
  #   url=''
  #   HTTParty.get(url['data']['en']['feeds'][3]['url']).parsed_response['data']['stations']
  # end
