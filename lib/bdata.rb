require 'httparty'

module BData
  def self.get(url)
    HTTParty.get(url).parsed_response
  end
end
