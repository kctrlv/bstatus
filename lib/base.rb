require './lib/bdata'
require './lib/url'

module Base
  def self.get(city)
    u = URL.base(city)
    BData.get(u)
  end
end
