require './lib/bdata'
require './lib/url'

module Info
  def self.get(city)
    u = URL.info(city)
    BData.get(u)
  end
end
