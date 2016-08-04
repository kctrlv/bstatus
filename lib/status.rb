require './lib/bdata'
require './lib/url'

module Status
  def self.get(city)
    u = URL.status(city)
    BData.get(u)
  end
end
